import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key,});
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
              child: SvgPicture.asset("assets/icons/back.svg")),
        ),
      ),
      extendBodyBehindAppBar: true,
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
                (size.height * 0.12).h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Create New\nPassword".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp),
                  ),
                ),
                8.h.verticalSpace,
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
                              controller: emailController),
                          16.h.verticalSpace,
                          commonField(
                              context: context,
                              image: 'assets/icons/lock.svg',
                              title: 'Password',
                              controller: passController),
                          16.h.verticalSpace,
                          8.h.verticalSpace,
                          commonButton(
                              backGroundColor: AppColors.kcPrimaryBlueColor,
                              textColor: Colors.white,
                    size: size,
                              text: "Create new Password",
                              borderRadius: 100.w,
                              onTap: () {
                                Get.toNamed('/register');
                              }),
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
}
