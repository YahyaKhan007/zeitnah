import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

class QrCodeScannerUtils {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final DataBaseService _dbService = DataBaseService();

  final dataController = Get.find<ZeitnahDataController>();

  Barcode? result;
  QRViewController? controller;

  Future<bool> requestCameraPermission() async {
    final permissionStatus = await Permission.camera.request();
    return permissionStatus == PermissionStatus.granted;
  }

  void onQRViewCreated(QRViewController controller) async {
    if (await requestCameraPermission()) {
      // Permission granted, proceed with QRView creation
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) async {
        result = scanData;

        // Perform action with scanned QR code value
        if (result != null) {
          print('Scanned QR code: ${result!.code}');

          controller.pauseCamera();

          dataController.scannedQrCodeValue.value = result!.code!;
          // You can trigger any action here, such as navigating to another screen or performing a function.
          // For example, you can call a function with the result value:
          await handleScannedQrCode(result!.code!);
        }
      });
    } else {
      // Permission denied or permanently denied, handle accordingly
      print('Camera permission denied');
    }
  }

  // Example function to handle the scanned QR code value
  Future<void> handleScannedQrCode(String qrCodeValue) async {
    // Here, you can perform any action based on the QR code value
    print('Handling QR code: $qrCodeValue');

    await _dbService.afterFetchingQrCode(qrCode: qrCodeValue);

    // For example, you can navigate to another screen or perform a database query, etc.
    // Get.toNamed('/somePage', arguments: qrCodeValue);
  }
}
