import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/auth_service.dart/auth_service.dart';

class ForgotPasswordController extends GetxController {
  final _authService = AuthService();

  TextEditingController emailController = TextEditingController();

  RxBool isSending = false.obs;

  sendForgetEmail() async {
    isSending.value = true;
    await _authService.forgetPassword(
        email: emailController.text.toLowerCase());
    isSending.value = false;
    Get.toNamed(
      '/login',
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailController.dispose();
    super.onClose();
  }
}
