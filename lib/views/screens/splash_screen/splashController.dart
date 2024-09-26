import 'package:get/get.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';

import '../../../services/auth_service.dart/auth_service.dart';

class SplashController extends GetxController {
  final _authService = AuthService();

  checkingForUserAuthentication() async {
    final userAuthenticated = await _authService.isUserLogin();

    if (userAuthenticated.isSuccess == false) {
      Get.offAllNamed(RouterHelperService.login);
    } else {
      Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("SplashController onReady called!");
    Future.delayed(
        const Duration(seconds: 0), () => checkingForUserAuthentication());
    super.onInit();
  }
}
