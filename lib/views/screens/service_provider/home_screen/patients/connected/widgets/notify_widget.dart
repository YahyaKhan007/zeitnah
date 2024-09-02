import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../services/services.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';

Widget notifyClient({
  required String label,
}) {
  final controller = Get.find<ZeitnahController>();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
      ),
      8.h.verticalSpace,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryBackgrundColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ]),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.willNotifyPatient.value
                  ? Image.asset("assets/icons/noti_bell.png", height: 32.r,)
                  : Image.asset("assets/icons/off_bell.png", height: 32.r,),
              Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                    activeTrackColor: AppColors.kcPrimaryBlueColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: AppColors.kcGreyColor,
                    value: controller.willNotifyPatient.value,
                    onChanged: (val) {
                      controller.willNotifyPatient.value = val;
                    }),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget priorPatient({
  required String label,
}) {
  final controller = Get.find<ZeitnahController>();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
      ),
      8.h.verticalSpace,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryBackgrundColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ]),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(

                "assets/icons/diomond_new.svg", height: 24.r,
                color: !controller.isPatientPriority.value
                    ? AppColors.kcPrimaryBlackColor
                    : const Color(0xffC4B420),
              ),
              8.w.horizontalSpace,
          Transform.scale(
            scale: 0.8,
            child:  Switch.adaptive(
                  activeTrackColor: AppColors.kcPrimaryBlueColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.kcGreyColor,
                  value: controller.isPatientPriority.value,
                  onChanged: (val) {
                    controller.isPatientPriority.value = val;
                  })),
            ],
          ),
        ),
      )
    ],
  );
}
