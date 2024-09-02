import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

Widget profileOptionEdit(
    {required VoidCallback onTap,
    required String label,
    required String data,
    required TextEditingController controller,
    required Size size}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24).h,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 12.sp,
                color: AppColors.kcGreyTextColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        8.h.verticalSpace,
        Container(
          height: 32.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          // margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48.r),
            border: Border.all(color: AppColors.kcGreyColor, width: 1),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 32.w,
                ),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.kcPrimaryBlueColor,
                            fontWeight: FontWeight.bold)),
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: data,
                      hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.kcPrimaryBlueColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                 Icon(
                  Icons.edit,
                  color: AppColors.kcPrimaryBlackColor,
                  size: 16.h,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
