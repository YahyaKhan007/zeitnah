import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/views/widgets/custome_button_with_icon.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';

addNotificationTime({required BuildContext context, required String label}) {
  Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  return showDialog(
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
                        itemCount: controller.notificationTime.length,
                        itemBuilder: (context, index) {
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
                                  Text(
                                    controller.notificationTime[index].time,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        controller.notificationTime.remove(
                                            controller.notificationTime[index]);
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
                            controller.notificationTime.length >= 3
                                ? null
                                : pickNotificationTime(
                                    context: context, controller: controller);
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
    required ZeitnahController controller}) async {
  Size size = MediaQuery.of(context).size;
  DateTime initialTime = DateTime.now();
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
                    initialDateTime: initialTime,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime dateTime) {
                      initialTime = dateTime;
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
                        controller.notificationTime
                            .add(AddTime(time: "09:00 - 15:00"));
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
