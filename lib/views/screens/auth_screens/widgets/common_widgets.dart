import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget commonField(
    {required BuildContext context,
    required String image,
    required String title,
    required TextEditingController controller}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
            offset: Offset(1, 1),
            spreadRadius: 0,
          )
        ]),
    height: 48.h,
    width: size.width,
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        SvgPicture.asset(image),
        16.w.horizontalSpace,
        Expanded(
          child: TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xff64748B),
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title.tr,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff64748B),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget commonButton(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: ScreenUtil().screenWidth,
      // height: 48.h,
      width: size.width * 0.6,

      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
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
      child: Center(
        child: Text(
          text.tr,
          style: TextStyle(
              color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget commonButtonWithLowWidth(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: ScreenUtil().screenWidth,
      // height: 48.h,
      width: size.width * 0.3,

      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
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
      child: Center(
        child: Text(
          text.tr,
          style: TextStyle(
              color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget commonFullSizeButton(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: ScreenUtil().screenWidth,
      // height: 48.h,
      width: width,

      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
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
      child: Center(
        child: Text(
          text.tr,
          style: TextStyle(
              color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
