import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import 'ui_functions.dart';

class AcceptDeclineRequest extends StatelessWidget {
  const AcceptDeclineRequest({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48.h,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: AppColors.kcGreyTextColor),
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
      padding: EdgeInsets.all(6.r),
      child: Row(
        children: [
          optionButton(
              onTap: () {
                patientRequestAccepted(context: context, name: "Alex Bright");
              },
              backColor: AppColors.kcPrimaryBlueColor,
              iconColor: Colors.white,
              image: 'assets/icons/check.png'),
          Expanded(
            child: Center(
              child: Text(
                "Alex Bright",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kcPrimaryBlackColor),
              ),
            ),
          ),
          optionButton(
              onTap: () {
                rejectPatientRequest(
                    context: context,
                    name: "Alex Bright",
                    no: () {
                      Get.back();
                    },
                    yes: () {
                      Get.back();
                    });
              },
              backColor: AppColors.kcPrimaryBlackColor,
              iconColor: Colors.white,
              image: 'assets/icons/check.png')
        ],
      ),
    );
  }

  Widget optionButton(
      {required VoidCallback onTap,
      required Color backColor,
      required Color iconColor,
      required String image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r), color: backColor),
        width: 80.w,
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
