import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';

acceptClientAppointment({
  required BuildContext context,
  required VoidCallback onYes,
}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24).w,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (size.height * 0.02).h.verticalSpace,
                    Center(
                      child: Text("Accept\nAppointment?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          commonButtonWithLowWidth(
                              backGroundColor: AppColors.kcPrimaryBlackColor,
                              textColor: Colors.white,
                              text: "Yes",
                              size: size,
                              borderRadius: 24.r,
                              onTap: onYes),
                          commonButtonWithLowWidth(
                              backGroundColor: AppColors.kcPrimaryBlueColor,
                              textColor: Colors.white,
                              text: "No",
                              size: size,
                              borderRadius: 24.r,
                              onTap: () {
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

rejectClientAppointment({
  required BuildContext context,
  required VoidCallback onYes,
}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (size.height * 0.02).h.verticalSpace,
                    Center(
                      child: Text("Delete\nAppointment?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          commonButtonWithLowWidth(
                              backGroundColor: AppColors.kcPrimaryBlackColor,
                              textColor: Colors.white,
                              text: "Yes",
                              size: size,
                              borderRadius: 24.r,
                              onTap: onYes),
                          commonButtonWithLowWidth(
                              backGroundColor: AppColors.kcPrimaryBlueColor,
                              textColor: Colors.white,
                              text: "No",
                              size: size,
                              borderRadius: 24.r,
                              onTap: () {
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
