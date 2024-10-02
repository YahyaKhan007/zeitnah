import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/auth_service.dart/auth_service.dart';
import 'package:zeitnah/services/controller_service/zeitnah_admin_controller.dart';

import '../../../../../utils/app_constants/app_constants.dart';

class WebRegisterController extends GetxController {
  final AuthService _auth = AuthService();

  final adminController = Get.find<ZeitnahAdminController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final isLoading = false.obs;
  final showPassword = false.obs;

  registerClinicUser() async {
    isLoading.value = true;
    final result = await _auth.signupUserWithEmailPassword(
        userEmail: emailController.text,
        userRole: 'clinic',
        userPassword: passwordController.text,
        confirmPassword: confirmPassword.text,
        firstName: nameController.text,
        lastName: null,
        isPriority: false,
        phoneNumber: "",
        profilePicture: "");
    isLoading.value = false;

    if (result.isSuccess == true) {
      adminController.authScreen.value = AuthScreenEnum.login;
    }
  }

  @override
  void dispose() {
    log("called");
    emailController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    streetController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
