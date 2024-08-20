import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../patient_views.dart';

Widget deletePatient(
  BuildContext context, {
  required String name,
}) {
  return GestureDetector(
    onTap: () {
      confirmDelete(
          context: context,
          name: name,
          yes: () {
            Get.back();
            deletedPatient(context: context, name: name);
          },
          no: () {
            Get.back();
          });
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      height: 40.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.kcPrimaryBlackColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 12.r,
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/icons/check.png",
              color: AppColors.kcPrimaryBlackColor,
              scale: 1.5,
            ),
          ),
          8.w.horizontalSpace,
          Text(
            "Delete Patient",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kcPrimaryBackgrundColor),
          ),
        ],
      ),
    ),
  );
}
