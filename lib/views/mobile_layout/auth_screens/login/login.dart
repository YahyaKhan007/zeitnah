import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import '../../../../services/services.dart';
import '../widgets/common_widgets.dart';
import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/backImage.png',
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (size.height * 0.075).h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Log In".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp),
                  ),
                ),
                16.h.verticalSpace,
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.kcPrimaryBackgrundColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          (size.height * 0.03).h.verticalSpace,
                          commonField(
                              context: context,
                              image: 'assets/icons/email.svg',
                              title: 'E-Mail',
                              controller: controller.emailController),
                          16.h.verticalSpace,
                          commonField(
                              context: context,
                              image: 'assets/icons/lock.svg',
                              title: 'Password',
                              controller: controller.passController),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 24.w),
                              child: TextButton(
                                child: Text(
                                  "Forgot?".tr,
                                  style: const TextStyle(
                                      color: AppColors.kcPrimaryBlueColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {
                                  // Get.toNamed(
                                  // RouterHelperService.createNewPassword);
                                  Get.toNamed(
                                      RouterHelperService.forgotPassword);
                                },
                              ),
                            ),
                          ),
                          16.h.verticalSpace,
                          customFunctionalButton(
                            backGroundColor: AppColors.kcPrimaryBlueColor,
                            textColor: Colors.white,
                            text: "Log In",
                            size: size,
                            borderRadius: 100.w,
                            isLoading: controller.isLoading,
                            onTap: controller.loginUser,
                          ),
                          (size.height * 0.05).h.verticalSpace,
                          Center(
                            child: Text(
                              "Not registered yet?".tr,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  letterSpacing: 0.8),
                            ),
                          ),
                          8.h.verticalSpace,
                          commonButton(
                              backGroundColor: AppColors.kcGreyColor,
                              size: size,
                              textColor: Colors.black,
                              text: "Sign Up",
                              borderRadius: 100.w,
                              onTap: () {
                                Get.toNamed('/register',
                                    arguments: {'isProvider': false});
                              }),
                          (size.height * 0.05).verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(right: 0.w),
                            child: TextButton(
                              child: Text(
                                "Register Your Clinic ".tr,
                                style: const TextStyle(
                                    color: AppColors.kcPrimaryBlueColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                // Get.toNamed(
                                // RouterHelperService.createNewPassword);
                                Get.toNamed(RouterHelperService.register,
                                    arguments: {'isProvider': true});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.kcPrimaryBackgrundColor),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Specify your role",
                        style: GoogleFonts.odorMeanChey(
                            textStyle: TextStyle(
                                fontSize: 30.sp, color: Colors.black)),
                      ),
                    ),
                    32.h.verticalSpace,
                    roleSelectButton(
                        role: 'service_provider', label: 'Service Provider'),
                    16.h.verticalSpace,
                    roleSelectButton(role: 'patient', label: 'Patient')
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
              Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
              break;

            case 'patient':
              Get.offAllNamed(RouterHelperService.clientHomeScreen);

              break;
          }
        },
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.kcGreyTextColor,
              fontWeight: FontWeight.bold),
        ));
  }
}
