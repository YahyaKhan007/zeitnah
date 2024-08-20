import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

import '../patient_views.dart';

class PatientConnected extends StatelessWidget {
  const PatientConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoScrollbar(
        thickness: 8.w,
        radius: Radius.circular(40.r),
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: AppConstants.workersList.length,
          itemBuilder: (context, index) {
            return patientName(
              drName: AppConstants.workersList[index],
              onTap: () {
                Get.to(() => ViewPatientDetails(
                      name: AppConstants.workersList[index],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}

Widget patientName(
    {required String drName, required VoidCallback onTap, String? image}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      margin: EdgeInsets.only(left: 24.w, right: 16.w, bottom: 16.h),
      height: 48.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.kcPrimaryBlueColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
            child: Text(
              drName,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          image != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                      backgroundColor: AppColors.kcPrimaryBackgrundColor,
                      child: SvgPicture.asset(image)))
              : const SizedBox(),
        ],
      ),
    ),
  );
}
