import 'package:get/get.dart';
import 'package:zeitnah/views/screens/auth_screens/forgot_password/forgot_password_controller.dart';
import 'package:zeitnah/views/screens/auth_screens/login/login_controller.dart';
import 'package:zeitnah/views/screens/auth_screens/register/register_controller/register_Controller.dart';
import 'package:zeitnah/views/screens/service_provider/provider_account_settings.dart/account_setting_home_service_provider_model.dart';
import 'package:zeitnah/views/screens/splash_screen/splashController.dart';

import 'services/services.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Use lazyPut for lazy initialization
    Get.lazyPut<ZeitnahController>(() => ZeitnahController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    // Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.put(SplashController(), permanent: false);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);
    Get.put(SplashController(), permanent: false);
    Get.lazyPut<AccountSettingHomeServiceProviderModel>(
        () => AccountSettingHomeServiceProviderModel(),
        fenix: true);
  }
}
