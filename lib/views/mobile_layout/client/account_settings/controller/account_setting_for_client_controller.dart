import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../../services/snackbar_service/snackbar_service.dart';

class AccountSettingForClientController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final SnackBarService snackBarService = SnackBarService();

  final DataBaseService _dbService = DataBaseService();

  RxBool isLoading = RxBool(false);

  late TextEditingController nameController;
  late TextEditingController surNameController;
  late TextEditingController phoneNumber;

  late String name;
  late String surName;

  late String phone;

  deleteClientAccount() async {
    isLoading.value = true;
    await _dbService.deleteClientAccount();
    isLoading.value = false;
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    surName = dataController.currentLoggedInPatient.value!.lastName;
    name = dataController.currentLoggedInPatient.value!.firstName;

    phone = dataController.currentLoggedInPatient.value!.phoneNumber.isNotEmpty
        ? dataController.currentLoggedInPatient.value!.phoneNumber
        : '';

    nameController = TextEditingController(text: name);
    phoneNumber = TextEditingController(text: phone);
    surNameController = TextEditingController(text: surName);
  }
}
