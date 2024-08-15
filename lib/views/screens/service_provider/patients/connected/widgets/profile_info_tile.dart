 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

Widget profileInfoTile({required String label, required String data}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24).w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kcPrimaryBlackColor),
          ),
          Container(
            height: 40.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.kcGreyColor,
              ),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Center(
              child: Text(
                data,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }