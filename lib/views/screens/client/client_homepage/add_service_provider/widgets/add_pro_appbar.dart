import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/views.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

PreferredSizeWidget addProAppBar(BuildContext context) {
  // final controller = Get.find<ZeitnahController>();
  return PreferredSize(
    preferredSize: Size.fromHeight(100.h),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Service Provider".tr,
                style: GoogleFonts.openSans(
                    color: AppColors.kcPrimaryBlackColor,
                    textStyle: TextStyle(
                        color: AppColors.kcPrimaryBlackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold)),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const AccountSettingHomeForClient());
                },
                child: Image.asset(
                  'assets/icons/menu.png',
                  color: Colors.black,
                ),
              ),
              8.w.horizontalSpace,
            ],
          ),
          16.h.verticalSpace,
          16.h.verticalSpace,
        ],
      ),
    ),
  );
}
