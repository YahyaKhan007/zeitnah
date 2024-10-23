import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';
import 'package:zeitnah/services/snackbar_service/snackbar_service.dart';
import 'package:zeitnah/utils/image_picker_utils/image_picker_utils.dart';

import '../../../../../services/auth_service.dart/auth_service.dart';

class AccountSettingForProviderController extends GetxController {
  final _authService = AuthService();
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();

  final SnackBarService snackBarService = SnackBarService();

  final pickerUtils = ImagePickerUtils();

  RxBool isLoading = RxBool(false);

  late String name;
  late String city;
  late String street;
  late String phone;
  late QrImageView myQrCode;

  List<String> addressParts = [];

  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController phoneNumberController;

  logout() async {
    await _authService.logoutUser();
  }

  onBack() async {
    updateClinicProfile();
    Get.back();

    return;
  }

  Future<void> updateClinicProfile() async {
    dataController.currentLoggedInClinic.value!.phoneNumber =
        phoneNumberController.text;
    dataController.currentLoggedInClinic.value!.address =
        "${streetController.text} * ${cityController.text}";

    dataController.currentLoggedInClinic.value!.clinicName =
        nameController.text;

    _dbService.updateClinicProfile();
  }

  Future<void> deleteAccount() async {
    isLoading.value = true;
    await _dbService.deleteAccount();
    isLoading.value = false;

    Get.offAllNamed(RouterHelperService.login);
  }

  Future<bool> launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Support Request', 'body': ''});

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
        return true;
      } else {
        print('Cannot launch $emailLaunchUri');
        // Handle the inability to launch
        return false;
      }
    } catch (e) {
      print('Error launching email: $e');
      return false;

      // Handle the error
    }
  }

  Future<void> pickImage() async {
    pickerUtils.pickImageFromGallery(
        clinicModel: dataController.currentLoggedInClinic.value!);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    name = dataController.currentLoggedInClinic.value!.clinicName.isNotEmpty
        ? dataController.currentLoggedInClinic.value!.clinicName
        : '';

    addressParts =
        dataController.currentLoggedInClinic.value!.address.isNotEmpty
            ? dataController.currentLoggedInClinic.value!.address.split("*")
            : [];
    city = dataController.currentLoggedInClinic.value!.address.isNotEmpty
        ? addressParts[1]
        : '';
    street = dataController.currentLoggedInClinic.value!.address.isNotEmpty
        ? addressParts[0]
        : '';
    phone = dataController.currentLoggedInClinic.value!.phoneNumber.isNotEmpty
        ? dataController.currentLoggedInClinic.value!.phoneNumber
        : '';

    nameController = TextEditingController(text: name);
    cityController = TextEditingController(text: city);
    streetController = TextEditingController(text: street);
    phoneNumberController = TextEditingController(text: phone);

    //   Qr code generate
    myQrCode = QrImageView(
      data: dataController.currentLoggedInClinic.value!.uid,
      version: QrVersions.auto,
      size: 200.0,
    );

    print("qr code generated   : $myQrCode");
  }
}
