// Appointment Option Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

Widget appointmentOption(
    {required String label,
    required String image,
    required VoidCallback onTap,
    required BuildContext context}) {
  // Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColors.kcGreyColor, width: 2.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image),
            16.w.horizontalSpace,
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.kcPrimaryBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget appointmentPriority(
    {required String label,
    required String image,
    required VoidCallback onTap,
    required BuildContext context}) {
  // Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.kcGreyColor, width: 2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => SvgPicture.asset(
              image,
              // ignore: deprecated_member_use
              color: controller.isPriorityFunction.value
                  ? const Color(0xffC4B420)
                  : null,
            ),
          ),
          16.w.horizontalSpace,
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.kcPrimaryBlackColor,
              ),
            ),
          ),
          Obx(
            () => Switch.adaptive(
                activeTrackColor: AppColors.kcPrimaryBlueColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.kcGreyColor,
                value: controller.isPriorityFunction.value,
                onChanged: (val) {
                  controller.isPriorityFunction.value = val;
                }),
          )
        ],
      ),
    ),
  );
}
