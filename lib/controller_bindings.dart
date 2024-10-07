import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/create/controller/create_appointment_controller.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/patients/patient_controller.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/login/controller/web_login_controller.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/registration/controller/web_register_controller.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/service_provider_home/appointment_pages/appointment_free_slot_widgets/controller/appoint_slot_controller.dart';

import 'services/controller_service/zeitnah_admin_controller.dart';
import 'services/services.dart';
import 'views/mobile_layout/auth_screens/forgot_password/forgot_password_controller.dart';
import 'views/mobile_layout/auth_screens/login/login_controller.dart';
import 'views/mobile_layout/auth_screens/register/register_controller/register_Controller.dart';
import 'views/mobile_layout/service_provider/home_screen/appointments/accepted/controller/accepted_appointment_controller.dart';
import 'views/mobile_layout/service_provider/home_screen/appointments/open/controller/open_appointment_controller.dart';
import 'views/mobile_layout/service_provider/home_screen/settings/controller/provider_setting_controller.dart';
import 'views/mobile_layout/service_provider/provider_account_settings.dart/account_setting_home_service_provider_model.dart';
import 'views/mobile_layout/splash_screen/splashController.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ZeitnahAdminController());
    Get.put(ZeitnahDataController());
    // Get.put(ProviderSettingController());
    // Use lazyPut for lazy initialization
    Get.lazyPut<PatientScreenController>(() => PatientScreenController(),
        fenix: true);
    Get.lazyPut<ZeitnahController>(() => ZeitnahController(), fenix: true);
    Get.lazyPut<ProviderSettingController>(() => ProviderSettingController(),
        fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);

    Get.lazyPut<AcceptedAppointmentController>(
        () => AcceptedAppointmentController(),
        fenix: true);
    Get.put(SplashController(), permanent: false);
    Get.lazyPut<AccountSettingHomeServiceProviderModel>(
        () => AccountSettingHomeServiceProviderModel(),
        fenix: true);
    Get.lazyPut<WebLoginController>(() => WebLoginController(), fenix: true);
    Get.lazyPut<AppointmentFreeSlotController>(
        () => AppointmentFreeSlotController(),
        fenix: true);
    Get.lazyPut<CreateAppointmentController>(
        () => CreateAppointmentController(),
        fenix: true);
    Get.lazyPut<OpenAppointmentController>(() => OpenAppointmentController(),
        fenix: true);
    Get.put(WebRegisterController());
  }
}
