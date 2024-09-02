import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../account_settings/account_settng_home.dart';

PreferredSizeWidget myCalenderAppbar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  return PreferredSize(
    preferredSize: Size.fromHeight(170.h),
    child: Container(
      decoration: const BoxDecoration(
        color: AppColors.kcPrimaryBackgrundColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.kcGreyTextColor.withOpacity(0.5),
        //     offset: const Offset(-1, 2),
        //     blurRadius: 10,
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          32.h.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.22.w,
              ),
              Text(
                "My Time Window".tr,
                style: GoogleFonts.openSans(
                    color: AppColors.kcPrimaryBlackColor,
                    textStyle: TextStyle(
                        color: AppColors.kcPrimaryBlackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(()=> const AccountSettingHomeForClient(), duration: const Duration(milliseconds: 500));
                },
                child: SvgPicture.asset('assets/icons/three_bar.svg', height: size.height * 0.04,),
              ),
              16.w.horizontalSpace,
            ],
          ),
          16.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containerOption(
                      context: context,
                      label: "Always",
                      value: controller.always.value),
                  containerOption(
                      context: context,
                      label: "My times",
                      value: controller.myTimes.value),
                  containerOption(
                      context: context,
                      label: "Mute",
                      value: controller.mute.value)
                ],
              ),
            ),
          ),
          16.h.verticalSpace,
        ],
      ),
    ),
  );
}

Widget containerOption({
  required BuildContext context,
  required String label,
  required bool value,
}) {
  Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  return Container(
    height: 60.h,
    width: size.width * 0.28,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: AppColors.kcPrimaryBackgrundColor,
      boxShadow: [
        BoxShadow(
          color: AppColors.kcGreyTextColor.withOpacity(0.4),
          offset: const Offset(-1, 2),
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: AppColors.kcPrimaryBlackColor,
            textStyle: TextStyle(
                color: AppColors.kcPrimaryBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            activeColor: Colors.white,
activeTrackColor: AppColors.kcPrimaryBlueColor,
              value: value,
              onChanged: (val) {
                controller.setNotification(value: label);
              }),
        ),
      ],
    ),
  );
}
