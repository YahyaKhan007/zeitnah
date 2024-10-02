// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/web_layout/constants/app_colors/app_colors.dart';

class SnackBarService {
  void showSnackBar(
      {required String message,
      required int duration,
      SnackPosition? snackPosition,
      Color? color,
      required String title}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: color ?? Colors.transparent,
        borderRadius: 50,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        snackPosition: snackPosition ?? SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(
          message,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.kcPrimaryWhite),
        ),
        title: title,
        titleText: Text(
          title,
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kcPrimaryWhite),
        ),
        duration: Duration(seconds: duration),
      ),
    );
  }

  void showErrorSnackBar({required String message, required String title}) {
    showSnackBar(
      message: message,
      duration: 2,
      color: Colors.red,
      title: title,
    );
  }

  void showSuccessSnackBar({required String message, required String title}) {
    showSnackBar(
      message: message,
      duration: 2,
      color: Colors.green,
      title: title,
    );
  }
}
