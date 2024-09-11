import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';


class RegisterScreen extends StatelessWidget {
  final bool isProvider;
  RegisterScreen({super.key, required this.isProvider});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
              child: SvgPicture.asset("assets/icons/back.svg",)),
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
            (size.height * 0.12).h.verticalSpace,
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
              24.h.verticalSpace,
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
                          controller: nameController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/person.svg',
                          title: 'Surname',
                          controller: surNameController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/email.svg',
                          title: 'E-Mail',
                          controller: emailController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/lock.svg',
                          title: 'Password',
                          controller: passController),
                      16.h.verticalSpace,

                          commonField(
                          context: context,
                          image: 'assets/icons/lock.svg',
                          title: 'Password',
                          controller: confirmPassController),
                      16.h.verticalSpace,
                      commonField(
                          context: context,
                          image: 'assets/icons/phone.svg',
                          title: 'Phone Number',
                          controller: phoneNumberController),
                      16.h.verticalSpace,
                      commonButton(
                          backGroundColor: AppColors.kcPrimaryBlueColor,
                          textColor: Colors.white,
                          text: "Registrieren",
                          size: size,
                          borderRadius: 100.w,
                          onTap: () {
                            isProvider ? Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen) : Get.offAllNamed(RouterHelperService.sharePhone);
                          }),
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
