import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/utils/qr_code_utils/qr_code_scanner_utils.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/loading_widget.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final QrCodeScannerUtils _qrCodeScannerUtils = QrCodeScannerUtils();
  final addProviderController = Get.find<AddServiceProvideController>();
  final dataController = Get.find<ZeitnahDataController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrCodeScannerUtils.controller!.pauseCamera();
    } else if (Platform.isIOS) {
      _qrCodeScannerUtils.controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          dataController.scannedQrCodeValue.value = '';
          return true;
        },
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              QRView(
                key: _qrCodeScannerUtils.qrKey,
                onQRViewCreated: (QRViewController controller) =>
                    _qrCodeScannerUtils.onQRViewCreated(controller),
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                ),
              ),
              Center(
                child: Obx(
                  () => Visibility(
                    visible: dataController.scannedQrCodeValue.value.isEmpty
                        ? false
                        : true,
                    child: loadingWidgetInkDrop(
                        size: 32.r, color: AppColors.kcPrimaryGreen),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
