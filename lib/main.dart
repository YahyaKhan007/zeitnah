import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_strings.dart';
import 'package:zeitnah/views/mobile_layout/splash_screen/splash_screen.dart';

import 'controller_bindings.dart';
import 'firebase_options.dart';
import 'get_storage_keys.dart';
import 'services/services.dart';
import 'views/web_layout/screens/service_provider/auth_screens/auth_screen_home.dart';

var uuid = const Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await GetStorage.init();
  final box = GetStorage();

  // box.write(GetStorageKeys.acceptedAppointmentsForClinic, 0);
  box.read(GetStorageKeys.acceptedAppointmentsForClinic) ??
      box.write(GetStorageKeys.acceptedAppointmentsForClinic, 0);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size designSize = constraints.maxWidth < 500
            ? const Size(360, 690)
            : const Size(1024, 768);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return GetMaterialApp(
              translations: AppStrings(),
              locale: const Locale('en_US'),
              fallbackLocale: const Locale('en_US'),
              initialBinding: ControllerBinding(),
              getPages: RouterHelperService.routes,
              debugShowCheckedModeBanner: false,
              home: const ResponsiveLayout(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: AppColors.kcPrimaryBackgrundColor,
                textTheme: Typography.englishLike2018
                    .apply(fontSizeFactor: 1.sp, fontFamily: 'poppins'),
              ),
            );
          },
        );
      },
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          print("Showing Mobile View");
          return const SplashScreen();
        } else {
          print("Showing Web View");
          return const AuthScreenHome();
        }
      },
    );
  }
}
