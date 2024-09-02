import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';
import 'package:zeitnah/views/screens/auth_screens/widgets/common_widgets.dart';

void pickDate({required BuildContext context}) async {
  Size size = MediaQuery.of(context).size;
  DateTime initialDate = DateTime.now();
  DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            // height: 270,
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
                  "Date",
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
                    initialDateTime: initialDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      initialDate = dateTime;
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
                        Navigator.of(context).pop(initialDate);
                      }),
                )
              ],
            ),
          ),
        ),
      );
    },
  );

  if (pickedDate != null) {
    // Do something with the pickedDate
    print("Selected date: $pickedDate");
  }
}

void pickTime({required BuildContext context, required String label}) async {
  Size size = MediaQuery.of(context).size;
  DateTime initialTime = DateTime.now();
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
                        Navigator.of(context).pop(initialTime);
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

void pickWorker({required BuildContext context}) async {
  Size size = MediaQuery.of(context).size;
  String? selectedWorker;
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
                      selectedWorker = initialWorker;
                      Navigator.of(context).pop(selectedWorker);
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

  if (selectedWorker != null) {
    // Do something with the selectedWorker
    print("Selected worker: $selectedWorker");
  }
}
