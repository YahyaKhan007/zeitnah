import 'package:get/get.dart';

import '../../views/views.dart';

class RouterHelperService {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/getStarted';
  static const String appointmentCreated = '/appointmentCreated';
  static const String forgotPassword = '/forgot';
  static const String createNewPassword = '/createNewPassword';

  static const String login = '/login';
  static const String register = '/register';
  static const String completeProfile = '/completeProfile';

  static const String special = '/special';
  static const String chatList = '/chatList';
  static const String chatRoom = '/chatRoom';
  static const String profile = '/profile';

  // Service Provider Home Pages
  static const String serviceProviderHomeScreen = '/serviceproviderHomeScreen';

  // Patient Home Pages

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPassword()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: createNewPassword, page: () => CreateNewPassword()),
    GetPage(name: appointmentCreated, page: () => const AppointmentCreated()),
    GetPage(name: register, page: () => RegisterScreen()),
    // GetPage(name: completeProfile, page: () => CompleteProfile()),
    // GetPage(name: special, page: () => const SpecialScreen()),
    // GetPage(name: chatList, page: () => const ChatListScreen()),
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
