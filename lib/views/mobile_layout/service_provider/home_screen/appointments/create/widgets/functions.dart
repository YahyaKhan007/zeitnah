import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

import '../../../../../auth_screens/widgets/common_widgets.dart';
import '../controller/create_appointment_controller.dart';

void pickDate(
    {required BuildContext context,
    required CreateAppointmentController controller}) async {
  Size size = MediaQuery.of(context).size;
  DateTime today = DateTime.now();
  DateTime tomorrow = today.add(const Duration(days: 1));
  DateTime? pickedDate; // Declare pickedDate here

  // Generate a list of dates from today up to the next 4 weeks (28 days)
  List<DateTime> dateList = List.generate(
    30,
    (index) => today.add(Duration(days: index)),
  );

  // Map the dates to their display values
  List<String> formattedDates = dateList.map((date) {
    String formattedDate =
        "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year.toString().substring(2)}";

    if (date.day == today.day &&
        date.month == today.month &&
        date.year == today.year) {
      return "$formattedDate (Today)";
    } else if (date.day == tomorrow.day &&
        date.month == tomorrow.month &&
        date.year == tomorrow.year) {
      return "$formattedDate (Tomorrow)";
    } else {
      return formattedDate;
    }
  }).toList();

  // Show the picker dialog
  await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(24.r),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                24.h.verticalSpace,
                Text(
                  "Select Date",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryBlackColor),
                ),
                16.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.kcGreyColor, width: 1),
                  ),
                  height: 100.h,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    onSelectedItemChanged: (int index) {
                      pickedDate =
                          dateList[index]; // Update the pickedDate here
                    },
                    children: formattedDates.map((String dateString) {
                      return Center(
                        child: Text(
                          dateString,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.kcPrimaryBlackColor,
                          ),
                        ),
                      );
                    }).toList(),
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
                        if (pickedDate != null) {
                          controller.appointmentDate.value = pickedDate!;
                        }
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

  // Do something with the picked date
  print("Selected date: ${controller.appointmentDate.value}");
}

void pickTime(
    {required BuildContext context,
    required String label,
    required CreateAppointmentController controller}) async {
  final dataController = Get.find<ZeitnahDataController>();
  Size size = MediaQuery.of(context).size;
  // DateTime initialTime = DateTime.now();
  DateTime initialTime = controller.appointmentDate.value;
  DateTime? pickedTime = await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(24.r),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                24.h.verticalSpace,
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryBlackColor),
                ),
                16.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: AppColors.kcGreyColor, width: 1)),
                  height: 100.h,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    initialDateTime: initialTime,
                    mode: CupertinoDatePickerMode.time,
                    selectionOverlayBuilder: (context,
                            {required columnCount, required selectedIndex}) =>
                        Container(
                      decoration: BoxDecoration(
                          color: AppColors.kcGreyColor.withOpacity(0.2)),
                    ),
                    onDateTimeChanged: (DateTime dateTime) {
                      initialTime = dateTime;
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
                        switch (label) {
                          case 'Start Time':
                            controller.appointmentStartTime.value = initialTime;
                            controller.appointmentEndTime.value =
                                initialTime.add(Duration(
                                    minutes: dataController
                                        .currentLoggedInClinic
                                        .value!
                                        .customTimeForAppointment));
                            log("Start Time");
                            break;
                          case 'End Time':
                            controller.appointmentEndTime.value = initialTime;
                            log("End Time");

                            break;
                        }
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

void pickWorker(
    {required BuildContext context,
    required CreateAppointmentController controller}) async {
  Size size = MediaQuery.of(context).size;

  String initialWorker = AppConstants.workersList[0];

  await showCupertinoModalPopup<String>(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(24.r),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                24.h.verticalSpace,
                Text(
                  "Select Worker",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kcPrimaryBlackColor,
                  ),
                ),
                16.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    // color: Colors.red,
                    border: Border.all(color: AppColors.kcGreyColor, width: 1),
                  ),
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    scrollController: FixedExtentScrollController(
                      initialItem:
                          AppConstants.workersList.indexOf(initialWorker),
                    ),
                    onSelectedItemChanged: (int index) {
                      initialWorker = AppConstants.workersList[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                          color: AppColors.kcGreyColor.withOpacity(0.2)),
                    ),
                    children: AppConstants.workersList.map((String worker) {
                      return Center(
                        child: Text(
                          worker,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.kcPrimaryBlackColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: commonButton(
                    backGroundColor: AppColors.kcPrimaryBlueColor,
                    textColor: Colors.white,
                    text: "Select",
                    size: size,
                    borderRadius: 40,
                    onTap: () {
                      controller.selectWorker.value = initialWorker;
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );

  if (controller.selectWorker.value != null) {
    // Do something with the selectedWorker
    print("Selected worker: $controller.selectWorker.value");
  }
}
