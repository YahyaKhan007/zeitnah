import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../models/models.dart';
import '../../../../services/auth_service.dart/auth_service.dart';
import '../../../../services/router_service/router_helper_service.dart';

class LoginController extends GetxController {
  final _authService = AuthService();
  final DataBaseService _dbService = DataBaseService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final isLoading = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;

    try {
      final result = await _authService.loginUser(
          email: emailController.text,
          password: passController.text,
          from: 'mobile_view');

      if (result.isSuccess) {
        if (result.clinicModel != null) {
          _dbService.getAllClinicAppointments();
          getPatientsData(result.clinicModel!);

          Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
        } else {
          Get.offAllNamed(RouterHelperService.clientHomeScreen);
        }
      }
    } catch (e) {
      // Handle any errors
    } finally {
      isLoading.value = false;
    }
  }

  getPatientsData(ClinicModel clinicModel) async {
    await _dbService.getAllPatientsData(clinicModel: clinicModel);
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
