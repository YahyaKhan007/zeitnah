import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../auth_screens/widgets/common_widgets.dart';

confirmDelete(
    {required BuildContext context,
    required String name,
    required VoidCallback yes,
    required VoidCallback no}) {
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
                      child: Text("Delete\n$name?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlackColor,
                            textColor: Colors.white,
                            text: "Yes",
                            size: size,
                            borderRadius: 24.r,
                            onTap: yes),
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlueColor,
                            textColor: Colors.white,
                            text: "No",
                            size: size,
                            borderRadius: 24.r,
                            onTap: no),
                      ],
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

deletedPatient({required BuildContext context, required String name}) {
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
                      child: Text("$name\n was successfully deleted!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    commonButtonWithLowWidth(
                        backGroundColor: AppColors.kcPrimaryBlueColor,
                        textColor: Colors.white,
                        text: "Continue",
                        size: size,
                        borderRadius: 24.r,
                        onTap: () {
                          Get.back();
                          Get.back();
                        }),
                    (size.height * 0.02).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
