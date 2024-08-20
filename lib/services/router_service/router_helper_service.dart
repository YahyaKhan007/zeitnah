import 'package:get/get.dart';

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

  // Settings
  static const String addTeamMember = '/addTeamMember';
  static const String priorityList = '/priorityList';


  // provider
  static const String appointmentCreated = '/appointmentCreated';
  static const String serviceProviderHomeScreen = '/serviceproviderHomeScreen';


  static const String clientHomeScreen = '/clientHomeScreen';
  static const String chatRoom = '/chatRoom';
  static const String profile = '/profile';

  // Service Provider Home Pages

  // Patient Home Pages

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPassword()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: createNewPassword, page: () => CreateNewPassword()),
    GetPage(name: appointmentCreated, page: () => const AppointmentCreated()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: addTeamMember, page: () => AddTeamMembers()),
    GetPage(name: priorityList, page: () => PriorityListScreen()),
    GetPage(name: clientHomeScreen, page: () => const ClientsHomeScreen()),
    // GetPage(
    //   name: chatRoom,
    //   page: () {
    //     final args = Get.arguments as Map<String, dynamic>;
    //     return ChatroomScreen(
    //       chatModel: args['chatModel'],
    //       targetUser: args['targetUser'],
    //     );
    //   },
    // ),
    // GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(
        name: serviceProviderHomeScreen,
        page: () => ServiceProviderHomeScreen()),
  ];
}
