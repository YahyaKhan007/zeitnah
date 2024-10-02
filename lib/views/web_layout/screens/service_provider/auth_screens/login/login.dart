import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/login/controller/web_login_controller.dart';
import 'package:zeitnah/views/widgets/loading_widget.dart';

import '../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';
import '../../../../utils/app_constants/app_constants.dart';
import '../../../../widgets/label_textfield_in_cloumn/label_textfield_in_cloumn.dart';
import '../../../admin_side/admin_home/admin_home.dart';
import '../../service_provider_home/service_provider_home.dart';

class LoginScreen extends GetView<WebLoginController> {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();

    return Container(
      height: size.height,
      width: size.width * 0.33,
      decoration: const BoxDecoration(
        color: AppColors.kcPrimaryWhite,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: Image.asset("assets/icons/app_icon.png")),
            Text(
              'Welcome back!',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            labelTextFieldColumnForLogin(
                loginController: controller,
                label: 'Login',
                hintText: 'Email or phone number',
                controller: controller.emailController),
            labelTextFieldColumnForLogin(
                loginController: controller,
                label: 'Password',
                hintText: 'Enter password',
                controller: controller.passController,
                trailingIcon: Icons.remove_red_eye),
            const SizedBox(height: 16),
            rememberMeRow(),
            const SizedBox(height: 16),
            signInButton(context),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Divider(
                color: AppColors.kcgreyFieldColor.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Don't have an account?  ",
                    style: TextStyle(
                        color: AppColors.kcPrimaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  GestureDetector(
                    onTap: () {
                      adminController.authScreen.value =
                          AuthScreenEnum.register;
                    },
                    child: const Text(
                      "Sign up now",
                      style: TextStyle(
                          color: AppColors.kcPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rememberMeRow() {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch.adaptive(
                  activeTrackColor: AppColors.kcPrimaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor:
                      AppColors.kcgreyFieldColor.withOpacity(0.4),
                  value: false,
                  onChanged: (val) {
                    // controller.isPriorityFunction.value = val;
                  },
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          CupertinoButton(
              child: const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget signInButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showRoleDialog(context);

        controller.loginUser();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryColor,
            borderRadius: BorderRadius.circular(8)),
        width: double.maxFinite,
        child: Center(
          child: Obx(
            () => !controller.isLoading.value
                ? const Text(
                    "Sign in",
                    style: TextStyle(
                      color: AppColors.kcPrimaryWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : loadingWidgetInkDrop(
                    size: 16, color: AppColors.kcPrimaryWhite),
          ),
        ),
      ),
    );
  }

  showRoleDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            animationDuration: const Duration(seconds: 1),
            child: Center(
              child: Container(
                width: size.width * 0.2,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.kcPrimaryWhite),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Specify your role",
                        style: GoogleFonts.odorMeanChey(
                            textStyle: const TextStyle(
                                fontSize: 30, color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 32),
                    roleSelectButton(
                        role: 'service_provider', label: 'Service Provider'),
                    const SizedBox(height: 16),
                    roleSelectButton(role: 'admin', label: 'Admin')
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget roleSelectButton({required String role, required String label}) {
    return TextButton(
        onPressed: () {
          switch (role) {
            case 'service_provider':
              Get.to(() => const ServiceProviderHome());
              break;

            case 'admin':
              Get.to(() => const AdminHome());

              break;
          }
        },

        // onPressed: () {
        //   switch (role) {
        //     case 'service_provider':
        //       Get.to(() => const ServiceProviderHome());
        //       break;
        //
        //     case 'admin':
        //       Get.to(() => const AdminHome());
        //       break;
        //   }
        // },
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              color: AppColors.kcgreyFieldColor,
              fontWeight: FontWeight.bold),
        ));
  }
}
