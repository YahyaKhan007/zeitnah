import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

Widget customeButtonWithIcon(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
     String? image,
    Color? imageColor,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: ScreenUtil().screenWidth,
      // height: 48.h,
      // width: size.width * 0.6,

      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         image == null ? CircleAvatar(
          backgroundColor: Colors.white,
          radius: 10.r,
          child:  Icon(Icons.check,color: AppColors.kcGreyTextColor,size: 16.r,))  : SvgPicture.asset(
            image,
            color: imageColor,
            height: 24.h,
          ),
          16.w.horizontalSpace,
          Text(
            text.tr,
            style: TextStyle(
                color: textColor, fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
