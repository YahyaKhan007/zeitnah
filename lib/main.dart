import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_strings.dart';

import 'blocs/blocs.dart';
import 'controller_bindings.dart';
import 'firebase_options.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
  final box = GetStorage();
  box.read('isFirstTime') ?? box.write('isFirstTime', true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: ((context) => SplashBloc())),
            ],
            child: GetMaterialApp(
              translations: AppStrings(),
              // locale: const Locale('de'),
              locale: const Locale('en_US'),
              // fallbackLocale: const Locale('de'),
              fallbackLocale: const Locale('en_US'),
              initialBinding: ControllerBinding(),
              debugShowCheckedModeBanner: false,
              initialRoute: RouterHelperService.splash,
              getPages: RouterHelperService.routes,
              navigatorKey: Get.key,
              title: 'Chat Bridge',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: AppColors.kcPrimaryBackgrundColor,
                textTheme: Typography.englishLike2018
                    .apply(fontSizeFactor: 1.sp, fontFamily: 'poppins'),
              ),
            ),
          );
        });
  }
}
