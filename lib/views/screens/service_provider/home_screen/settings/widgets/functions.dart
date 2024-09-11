import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../services/services.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_constants.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';

void selectDefaultTime({required BuildContext context, String? label}) async {
  Size size = MediaQuery.of(context).size;
  int? selectedTime;
  int initialTime = AppConstants.defaultAppointmentTime[0];

  selectedTime = await showCupertinoModalPopup<int>(
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
                  label ?? "Time Settings",
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
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                          color: AppColors.kcGreyColor.withOpacity(0.2)),
                    ),
                    scrollController: FixedExtentScrollController(
                      initialItem: AppConstants.defaultAppointmentTime
                          .indexOf(initialTime),
                    ),
                    onSelectedItemChanged: (int index) {
                      initialTime = AppConstants.defaultAppointmentTime[index];
                    },
                    children:
                        AppConstants.defaultAppointmentTime.map((int worker) {
                      return Center(
                        child: Text(
                          "$worker min",
                          style: TextStyle(
                            fontSize: 16.sp,
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
                      Navigator.of(context).pop<int>(initialTime);
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

  if (selectedTime != null) {
    // Do something with the selected time
    print("Selected time: $selectedTime");
  }
}

void setPriorityTime({required BuildContext context}) async {
  Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  int? selectedTime;
  int initialTime = AppConstants.defaultAppointmentTime[0];

  selectedTime = await showCupertinoModalPopup<int>(
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
                  "Set Priority time",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kcPrimaryBlackColor,
                  ),
                ),
                16.h.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: AppConstants.setPriorityTime.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.kcGreyColor, width: 1),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                24.w.horizontalSpace,
                                Text(
                                  "${AppConstants.setPriorityTime[index]} Minutes",
                                  style: TextStyle(
                                      color: AppColors.kcPrimaryBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                                Radio(
                                    value: AppConstants.setPriorityTime[index],
                                    groupValue:
                                        controller.setPriorityTime.value,
                                    onChanged: (value) {
                                      controller.setPriorityTime.value = value!;
                                      controller.customPriority.value = false;
                                    })
                              ],
                            )),
                      ),
                    );
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Obx(
                      () => Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.kcGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              24.w.horizontalSpace,
                              Text(
                                "Custom",
                                style: TextStyle(
                                    color: AppColors.kcPrimaryBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Radio(
                                  value: controller.customPriority.value,
                                  groupValue: true,
                                  onChanged: (value) {
                                    controller.setPriorityTime.value = 0;
                                    controller.customPriority.value = true;
                                    Get.back();

                                    selectDefaultTime(
                                        context: context, label: "Custom Time");
                                  })
                            ],
                          )),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: commonButton(
                    backGroundColor: AppColors.kcPrimaryBlueColor,
                    textColor: Colors.white,
                    text: "Set",
                    size: size,
                    borderRadius: 40,
                    onTap: () {
                      Navigator.of(context).pop<int>(initialTime);
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

  if (selectedTime != null) {
    // Do something with the selected time
    print("Selected time: $selectedTime");
  }
}

void addMember(
    {required BuildContext context,
    required TextEditingController nameController}) async {
  Size size = MediaQuery.of(context).size;
  int? selectedTime;
  int initialTime = AppConstants.defaultAppointmentTime[0];

  selectedTime = await showCupertinoModalPopup<int>(
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
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                8.h.verticalSpace,
                Text(
                  "Add Member",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kcPrimaryBlackColor,
                  ),
                ),
                8.h.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 32.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kcGreyColor.withOpacity(0.5)),
                  child: Center(
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kcPrimaryBlackColor),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kcGreyTextColor),
                          hintText: "✎ Type..."),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: commonButtonWithLowWidth(
                    backGroundColor: AppColors.kcPrimaryBlueColor,
                    textColor: Colors.white,
                    text: "Add",
                    size: size,
                    borderRadius: 40,
                    onTap: () {
                      final controller = Get.find<ZeitnahController>();
                      controller.memberList.add(nameController.text);
                      Navigator.of(context).pop<int>(initialTime);
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

  if (selectedTime != null) {
    // Do something with the selected time
    print("Selected time: $selectedTime");
  }
}

removeMember(
    {required BuildContext context,
    required String name,
    required VoidCallback yes,
    required VoidCallback no}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (size.height * 0.02).h.verticalSpace,
                    Center(
                      child: Text("Delete\n$name?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlackColor,
                            textColor: Colors.white,
                            text: "Yes",
                            size: size,
                            borderRadius: 24.r,
                            onTap: yes),
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlueColor,
                            textColor: Colors.white,
                            text: "No",
                            size: size,
                            borderRadius: 24.r,
                            onTap: no),
                      ],
                    ),
                    (size.height * 0.01).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
