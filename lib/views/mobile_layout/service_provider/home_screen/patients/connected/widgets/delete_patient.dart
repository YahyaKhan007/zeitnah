import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../patient_controller.dart';
import '../../patient_views.dart';

Widget deletePatient(BuildContext context,
    {required UserModel user, PatientScreenController? controller}) {
  return GestureDetector(
    onTap: () {
      confirmDelete(
          context: context,
          name: "${user.firstName} ${user.lastName}",
          yes: () {
            Get.back();
            controller!.deleteConnectedUser(user);
            deletedPatient(
                context: context, name: "${user.firstName} ${user.lastName}");
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
          Image.asset(
            "assets/icons/close.png",
            // color: AppColors.kcPrimaryBlackColor,
            // scale: 1.5,
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
