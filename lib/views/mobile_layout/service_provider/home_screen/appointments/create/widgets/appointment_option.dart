import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/create/controller/create_appointment_controller.dart';

import '../../../../../../views.dart';
// Appointment Option Widget

Widget appointmentOption(
    {required String label,
    required CreateAppointmentController controller,
    required String image,
    required VoidCallback onTap,
    required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
          border: Border.all(color: AppColors.kcGreyColor, width: 1.w),
        ),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                image,
                // height: size.height * 0.04,
                color: AppColors.kcPrimaryBlueColor,
              ),
              16.w.horizontalSpace,
              Expanded(child: controller.returnTextToShow(label: label)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget appointmentPriority(
    {required String label,
    required String image,
    required CreateAppointmentController viewModelController,
    required VoidCallback onTap,
    required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  final controller = Get.find<ZeitnahController>();
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.kcGreyColor, width: 2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => SvgPicture.asset(
              image,
              // ignore: deprecated_member_use
              height: size.height * 0.03,
              color: controller.isPriorityFunction.value
                  ? const Color(0xffC4B420)
                  : null,
            ),
          ),
          16.w.horizontalSpace,
          Expanded(
            child: Obx(
              () => Text(
                "$label  ${viewModelController.priorityTime.value == 0 ? "" : "(${viewModelController.priorityTime.value} min)"}",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.kcPrimaryBlackColor,
                ),
              ),
            ),
          ),
          Obx(() => Transform.scale(
                scale: 0.8, // Adjust the scale value to make the Switch smaller
                child: Switch(
                  activeTrackColor: AppColors.kcPrimaryBlueColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.kcGreyColor,
                  value: viewModelController.isPriority.value,
                  onChanged: (val) {
                    viewModelController.isPriority.value = val;
                    if (val) {
                      setPriorityTime(
                          context: context, controller: viewModelController);
                    } else {
                      viewModelController.priorityTime.value = 0;
                    }
                  },
                ),
              ))
        ],
      ),
    ),
  );
}
