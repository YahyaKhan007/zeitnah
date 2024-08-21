import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget customeButtonWithIcon(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
    required String image,
    required Color imageColor,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: ScreenUtil().screenWidth,
      // height: 48.h,
      // width: size.width * 0.6,

      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
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
          SvgPicture.asset(
            image,
            color: imageColor,
            height: 24.h,
          ),
          16.w.horizontalSpace,
          Text(
            text.tr,
            style: TextStyle(
                color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
