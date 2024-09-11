import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

import 'ui_functions.dart';

Widget customeNotification({required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),

        // color: AppColors.kcPrimaryBackgrundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kcGreyTextColor.withOpacity(0.3),
            offset: const Offset(0, 0),
            blurStyle: BlurStyle.inner,
            blurRadius: 10,
          ),
        ],
      ),
      height: size.height,
      width: size.width,
      child: Container(
        padding: EdgeInsets.only(top: 8.h),
        margin: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.kcPrimaryBackgrundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              dayContainer(
                  day: AppConstants.weekDays[0],
                  dailySchedule: [
                    {'start': "08:00", 'end': '10:00'},
                    {'start': "12:00", 'end': '16:00'},
                    {'start': "16:00", 'end': '24:00'},
                  ],
                  size: size,
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[0]);
                  }),
              dayContainer(
                  day: AppConstants.weekDays[1],
                  dailySchedule: [
                    {'start': "08:00", 'end': '10:00'},
                    {'start': "12:00", 'end': '16:00'},
                  ],
                  size: size,
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[1]);
                  }),
              dayContainer(
                  day: AppConstants.weekDays[2],
                  dailySchedule: [
                    {'start': "08:00", 'end': '10:00'},
                  ],
                  size: size,
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[2]);
                  }),
              dayContainer(
                  day: AppConstants.weekDays[3],
                  dailySchedule: [
                    {'start': "08:00", 'end': '10:00'}
                  ],
                  size: size,
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[3]);
                  }),
              dayContainer(
                  day: AppConstants.weekDays[4],
                  dailySchedule: [],
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[4]);
                  },
                  size: size),
              dayContainer(
                  day: AppConstants.weekDays[5],
                  dailySchedule: [],
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[5]);
                  },
                  size: size),
              dayContainer(
                  day: AppConstants.weekDays[6],
                  dailySchedule: [
                    {'start': "08:00", 'end': '10:00'},
                    {'start': "16:00", 'end': '24:00'},
                  ],
                  size: size,
                  onTap: () {
                    addNotificationTime(
                        context: context, label: AppConstants.weekDays[6]);
                  }),
            ],
          ),
        ),
      ));
}

Widget dayContainer({
  required String day,
  required Size size,
  required List<Map<String, String>> dailySchedule,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: size.height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: AppColors.kcPrimaryBlueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          24.w.horizontalSpace,
          Expanded(
              child: ListView.builder(
                  itemCount: dailySchedule.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final time = dailySchedule[index];
                    return SizedBox(
                      width: size.width * 0.165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            time['start'].toString(),
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          Text(
                            time['end'].toString(),
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    ),
  );
}
