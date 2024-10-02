import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/auth_service.dart/auth_service.dart';

import '../../../../../services/services.dart';

class RegisterController extends GetxController {
  final authService = AuthService();

  // Use lazy initialization for TextEditingControllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final isLoading = false.obs;
  final profilePicture = ''.obs;

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

// Uncomment and update the registerUser method as needed
  Future<void> registerUser() async {
    isLoading.value = true;
    log("isLoading = ${isLoading.value}");
    try {
      final result = await authService.signupUserWithEmailPassword(
        userEmail: emailController.text,
        userRole: "patient",
        userPassword: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        isPriority: false,
        phoneNumber: phoneNumberController.text,
        profilePicture: profilePicture.value,
      );
      isLoading.value = false;
      log("isLoading = ${isLoading.value}");
      if (result.isSuccess) {
        Get.offAllNamed(RouterHelperService.login);
      } else {
        // Handle registration failure
      }
    } catch (e) {
      isLoading.value = false;
      log("isLoading = ${isLoading.value}");
      // Handle any errors
    } finally {
      isLoading.value = false;
      log("isLoading = ${isLoading.value}");
    }
  }
}
