import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/screens/auth_screens/register/register_controller/register_Controller.dart';

import '../widgets/common_widgets.dart';

class RegisterScreen extends GetView<RegisterController> {
  final bool isProvider;
  const RegisterScreen({super.key, required this.isProvider});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              )),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: size.height,
        width: size.width,
        // padding: EdgeInsets.only(top: size.height * 0.285),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backImage.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (size.height * 0.075).h.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                "Register".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp),
              ),
            ),
            16.h.verticalSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kcPrimaryBackgrundColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      (size.height * 0.03).h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/person.svg',
                          title: 'Name',
                          controller: controller.firstNameController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/person.svg',
                          title: 'Surname',
                          controller: controller.lastNameController),
                      16.h.verticalSpace,
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
                          controller: controller.passwordController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/lock.svg',
                          title: 'Confirm Password',
                          controller: controller.confirmPasswordController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/phone.svg',
                          title: 'Phone Number',
                          controller: controller.phoneNumberController),
                      16.h.verticalSpace,
                      customFunctionalButton(
                        backGroundColor: AppColors.kcPrimaryBlueColor,
                        textColor: Colors.white,
                        text: "Registrieren",
                        size: size,
                        borderRadius: 100.w,
                        isLoading: controller.isLoading,
                        onTap: controller.registerUser,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
