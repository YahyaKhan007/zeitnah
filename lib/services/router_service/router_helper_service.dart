import 'package:get/get.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/auth_screen_home.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/service_provider_home/service_provider_home.dart';

import '../../controller_bindings.dart';
import '../../views/mobile_layout/auth_screens/register/share_phone_number.dart';
import '../../views/views.dart';

class RouterHelperService {
  // Auth
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/getStarted';
  static const String forgotPassword = '/forgot';
  static const String createNewPassword = '/createNewPassword';
  static const String login = '/login';
  static const String register = '/register';
  static const String sharePhone = '/sharePhone';

  // Settings
  static const String addTeamMember = '/addTeamMember';
  static const String priorityList = '/priorityList';

  // provider
  static const String appointmentCreated = '/appointmentCreated';
  static const String serviceProviderHomeScreen = '/serviceProviderHomeScreen';
  static const String webServiceProviderHome = '/webServiceProvider';

  static const String clientHomeScreen = '/clientHomeScreen';
  static const String chatRoom = '/chatRoom';
  static const String profile = '/profile';

  // Service Provider Home Pages

  static const String authForWeb = '/authScreen';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: ControllerBinding(),
    ),
    GetPage(name: forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: login, page: () => const Login()),
    GetPage(
      name: appointmentCreated,
      page: () {
        final args = Get.arguments;

        return AppointmentCreated(
          clinicName: args['clinicName'],
          worker: args['worker'] ?? '',
          date: args['date'],
          appointmentTime: args['appointmentTime'],
        );
      },
    ),
    GetPage(name: createNewPassword, page: () => CreateNewPassword()),
    GetPage(name: addTeamMember, page: () => AddTeamMembers()),
    GetPage(name: priorityList, page: () => PriorityListScreen()),
    GetPage(name: clientHomeScreen, page: () => const ClientsHomeScreen()),
    GetPage(name: authForWeb, page: () => const AuthScreenHome()),
    GetPage(
      name: register,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return RegisterScreen(
          isProvider: args['isProvider'],
        );
      },
    ),
    GetPage(name: sharePhone, page: () => const SharePhoneNumber()),
    GetPage(
        name: serviceProviderHomeScreen,
        page: () => ServiceProviderHomeScreen()),
    GetPage(
        name: webServiceProviderHome, page: () => const ServiceProviderHome()),
  ];
}
