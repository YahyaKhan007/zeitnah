import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/my_time_calender/controller/my_calender_controller.dart';
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
import 'views/mobile_layout/client/account_settings/controller/account_setting_for_client_controller.dart';
import 'views/mobile_layout/service_provider/home_screen/appointments/accepted/controller/accepted_appointment_controller.dart';
import 'views/mobile_layout/service_provider/home_screen/appointments/open/controller/open_appointment_controller.dart';
import 'views/mobile_layout/service_provider/home_screen/settings/controller/provider_setting_controller.dart';
import 'views/mobile_layout/service_provider/provider_account_settings.dart/controller/account_setting_for_provider_controller.dart';
import 'views/mobile_layout/splash_screen/splashController.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ZeitnahAdminController());
    Get.put(ZeitnahDataController());

    Get.lazyPut<MyTimeCalendarController>(() => MyTimeCalendarController(),
        fenix: true);
    // Use lazyPut for lazy initialization

    Get.lazyPut<PatientScreenController>(() => PatientScreenController(),
        fenix: true);

    // Get.put(AppointmentControllerForClient());
    Get.lazyPut<AppointmentControllerForClient>(
        () => AppointmentControllerForClient(),
        fenix: true);
    Get.lazyPut<ZeitnahController>(() => ZeitnahController(), fenix: true);
    Get.lazyPut<ProviderSettingController>(() => ProviderSettingController(),
        fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);
    Get.lazyPut<AddServiceProvideController>(
        () => AddServiceProvideController(),
        fenix: true);

    Get.lazyPut<AcceptedAppointmentController>(
        () => AcceptedAppointmentController(),
        fenix: true);
    Get.lazyPut<AccountSettingForClientController>(
        () => AccountSettingForClientController(),
        fenix: true);
    Get.put(SplashController(), permanent: false);
    Get.lazyPut<AccountSettingForProviderController>(
        () => AccountSettingForProviderController(),
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

    // Get.put(OpenControllerForOpenAppointment());
  }
}
