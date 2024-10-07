import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../utils/app_constants/app_constants.dart';
import 'auth_screens.dart';
import 'registration/register.dart';

class AuthScreenHome extends StatefulWidget {
  const AuthScreenHome({super.key});

  @override
  State<AuthScreenHome> createState() => _AuthScreenHomeState();
}

class _AuthScreenHomeState extends State<AuthScreenHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () => AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: size.height,
                // width: size.width * 0.33,
                // alignment:adminController.authScreen.value == AuthScreenEnum.login
                //         ?Alignment.centerLeft : Alignment.center,
                decoration:
                    const BoxDecoration(color: AppColors.kcPrimaryColor),
                child: SizedBox(
                    height: size.height,
                    width: size.width * 0.33,
                    child:
                        adminController.authScreen.value == AuthScreenEnum.login
                            ? LoginScreen()
                            : const Center(child: RegisterationScreen()))),
          ),
          Expanded(
              child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ))
          // Container(
          //   // alignment: adminController.authScreen.value == AuthScreenEnum.login
          //   //     ? Alignment.centerLeft
          //   //     : Alignment.center,
          //   height: size.height,
          //   width: size.width,
          //   decoration: const BoxDecoration(
          //     color: AppColors.kcPrimaryColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
