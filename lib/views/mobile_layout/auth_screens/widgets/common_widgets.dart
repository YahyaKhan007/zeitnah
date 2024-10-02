import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/widgets/loading_widget.dart';

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
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(1, 1),
            spreadRadius: -4,
          )
        ]),
    height: 48.h,
    width: size.width,
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        SvgPicture.asset(
          image,
          height: size.height * 0.03,
        ),
        16.w.horizontalSpace,
        Expanded(
          child: TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0xff64748B),
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title.tr,
              hintStyle: TextStyle(
                fontSize: 12.sp,
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
    bool? isLoading,
    required String text,
    required Size size,
    required double borderRadius,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Center(
        child: isLoading != null && isLoading == true
            ? loadingWidgetInkDrop(
                size: 16.r, color: AppColors.kcPrimaryBackgrundColor)
            : Text(
                text.tr,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
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
      width: size.width * 0.35,

      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: -4,
            )
          ]),
      child: Center(
        child: Text(
          text.tr,
          style: TextStyle(
              color: textColor, fontSize: 12.sp, fontWeight: FontWeight.bold),
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
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: -4,
            )
          ]),
      child: Center(
        child: Text(
          text.tr,
          style: TextStyle(
              color: textColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget customFunctionalFullSizeButton(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
    required double borderRadius,
    required VoidCallback onTap,
    required RxBool isLoading}) {
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
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: -4,
            )
          ]),
      child: Center(
        child: Obx(() => isLoading.value
            ? loadingWidgetInkDrop(
                size: 16.r, color: AppColors.kcPrimaryBackgrundColor)
            : Text(
                text.tr,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              )),
      ),
    ),
  );
}

Widget customFunctionalButton(
    {required Color backGroundColor,
    required Color textColor,
    double? width,
    required String text,
    required Size size,
    required double borderRadius,
    required VoidCallback onTap,
    required RxBool isLoading}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Center(
        child: Obx(() => isLoading.value
            ? loadingWidgetInkDrop(
                size: 16.r, color: AppColors.kcPrimaryBackgrundColor)
            : Text(
                text.tr,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              )),
      ),
    ),
  );
}
