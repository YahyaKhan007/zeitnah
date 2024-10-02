import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../services/auth_service.dart/auth_service.dart';
import '../../../../../../../services/router_service/router_helper_service.dart';

class WebLoginController extends GetxController {
  final _authService = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final isLoading = false.obs;
  final showPassword = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;

    try {
      final result = await _authService.loginUser(
          email: emailController.text,
          password: passController.text,
          from: 'clinic');
      isLoading.value = false;

      if (result.isSuccess) {
        Get.offAllNamed(RouterHelperService.webServiceProviderHome);
      } else {
        // Handle registration failure
      }
    } catch (e) {
      isLoading.value = false;

      // Handle any errors
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
