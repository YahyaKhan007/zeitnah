import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/my_time_calender/controller/my_calender_controller.dart';
import 'package:zeitnah/views/widgets/custome_button_with_icon.dart';
import 'package:zeitnah/views/widgets/formatting.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';

addNotificationTime({
  required BuildContext context,
  required String label,
  required RxList<dynamic> dayList,
  required MyTimeCalendarController controller,
}) {
  Size size = MediaQuery.of(context).size;
  // final controller = Get.find<ZeitnahController>();
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Center(
              child: Obx(
                () => Container(
                  height: size.height * 0.6,
                  padding: const EdgeInsets.symmetric(horizontal: 16).w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (size.height * 0.01).h.verticalSpace,
                      Center(
                        child: Text(label,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.murecho(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColors.kcPrimaryBlackColor,
                                    fontWeight: FontWeight.bold))),
                      ),
                      (size.height * 0.02).h.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: dayList.length,
                        itemBuilder: (context, index) {
                          var startTime = dayList[index]['start'];
                          var endTime = dayList[index]['end'];

                          if (startTime.runtimeType == Timestamp) {
                            log("The value is TimeStamp");
                            startTime = startTime.toDate();
                            endTime = endTime.toDate();
                          } else {
                            log("The value is DateTime");
                          }

                          log("type : ${startTime.runtimeType}");

                          return Container(
                            height: 40.h,
                            margin: EdgeInsets.only(
                                bottom: 16.h, left: 16.w, right: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.r),
                                color: AppColors.kcPrimaryBlueColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16).w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  32.w.horizontalSpace,
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "${formatTime(time: startTime)} - ${formatTime(time: endTime)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        dayList.remove(dayList[index]);
                                      },
                                      child: CircleAvatar(
                                        radius: 16.r,
                                        backgroundColor: Colors.white,
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      customeButtonWithIcon(
                          backGroundColor: AppColors.kcPrimaryBlueColor,
                          textColor: Colors.white,
                          text: "Add My Time",
                          size: size,
                          image: "assets/icons/edit.svg",
                          borderRadius: 40.r,
                          onTap: () {
                            if (dayList.length >= 3) {
                              controller.snackBarService.showSnackBar(
                                  message:
                                      "You can not select more than 3 slots",
                                  duration: 2,
                                  color: AppColors.kcgreyFieldColor,
                                  title: "Max Selected");
                            } else {
                              pickNotificationTime(
                                  dayList: dayList,
                                  context: context,
                                  controller: controller);
                            }
                          }),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          commonButtonWithLowWidth(
                              backGroundColor: AppColors.kcPrimaryBlackColor,
                              textColor: Colors.white,
                              text: "Back",
                              size: size,
                              borderRadius: 24.r,
                              onTap: () {
                                print(
                                    "The List value is : ${dayList.toString()}");

                                controller.updateNotifyTable(
                                    day: label.toLowerCase(),
                                    dayTimeList: dayList);

                                Get.back();
                              }),
                        ],
                      ),
                      (size.height * 0.01).h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

class AddTime {
  final String time;
  AddTime({required this.time});
}

void pickNotificationTime(
    {required BuildContext context,
    required List dayList,
    required MyTimeCalendarController controller}) async {
  Size size = MediaQuery.of(context).size;
  DateTime fromInitialTime = DateTime.now();
  DateTime toInitialTime = DateTime.now();
  DateTime? pickedTime = await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Material(
        elevation: 50,
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: size.height * 0.6,
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(24.r),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                24.h.verticalSpace,
                Text("Set Time",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.murecho(
                        textStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.kcPrimaryBlackColor,
                            fontWeight: FontWeight.bold))),
                16.h.verticalSpace,
                Text(
                  "From",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                8.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: AppColors.kcGreyColor, width: 1)),
                  height: 80.h,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    initialDateTime: fromInitialTime,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime dateTime) {
                      fromInitialTime = dateTime;
                    },
                  ),
                ),
                16.h.verticalSpace,
                Text(
                  "To",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                8.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: AppColors.kcGreyColor, width: 1)),
                  height: 80.h,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    initialDateTime: toInitialTime,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime dateTime) {
                      toInitialTime = dateTime;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: commonButton(
                      backGroundColor: AppColors.kcPrimaryBlueColor,
                      textColor: Colors.white,
                      text: "Set",
                      size: size,
                      borderRadius: 40,
                      onTap: () {
                        print(
                            "Starting time : ${formatTime(time: fromInitialTime)}");
                        print(
                            "Ending time : ${formatTime(time: toInitialTime)}");

                        // dayList.add({});
                        dayList.add(
                            {'start': fromInitialTime, 'end': toInitialTime});

                        // controller.notificationTime
                        //     .add(AddTime(time: "09:00 - 15:00"));
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        ),
      );
    },
  );

  if (pickedTime != null) {
    // Do something with the pickedTime
    print("Selected time: $pickedTime");
  }
}
