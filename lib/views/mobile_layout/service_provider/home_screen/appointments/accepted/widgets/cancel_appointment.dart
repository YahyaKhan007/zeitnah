import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../widgets/formatting.dart';
import '../../../../../auth_screens/widgets/common_widgets.dart';
import '../controller/accepted_appointment_controller.dart';

confirmCancelAppointment(
    {required BuildContext context,
    required AppointmentModel appointment,
    required AcceptedAppointmentController controller}) {
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
                    (size.height * 0.03).h.verticalSpace,
                    Center(
                      child: Text("Cancel Appointment?",
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.03).h.verticalSpace,
                    cancelAppointment2(
                        drName: appointment.workerName.toString(),
                        time:
                            '${formatTime(time: appointment.startTime!)} - ${formatTime(time: appointment.endTime!)}',
                        date: formatDate(date: appointment.startTime!),
                        size: size,
                        onCancel: () {}),
                    (size.height * 0.02).h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlackColor,
                            textColor: Colors.white,
                            text: 'Yes',
                            size: size,
                            borderRadius: 48.r,
                            onTap: () {
                              controller.cancelAppointment(
                                  appointment: appointment);

                              Get.back();
                            }),
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlueColor,
                            textColor: Colors.white,
                            text: 'No',
                            size: size,
                            borderRadius: 48.r,
                            onTap: () {
                              Get.back();
                            }),
                      ],
                    ),
                    (size.height * 0.02).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget cancelAppointment2({
  required String drName,
  required String time,
  required String date,
  required Size size,
  required VoidCallback onCancel,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24).h,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        border: Border.all(
          color: AppColors.kcGreyColor,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.kcPrimaryBlueColor,
                  borderRadius: BorderRadius.circular(
                    48.r,
                  ),
                ),
                child: Center(
                  child: Text(
                    drName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              8.h.verticalSpace,
              Text(
                time,
                style: TextStyle(
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              8.h.verticalSpace,
              Text(
                date,
                style: TextStyle(
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tileOption({required String image, required String title}) {
  return SizedBox(
    height: 32.h,
    child: ListTile(
      minVerticalPadding: 0,
      leading: SvgPicture.asset(
        image,
        height: 24.r,
        color: AppColors.kcPrimaryBlackColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.kcPrimaryBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300),
      ),
    ),
  );
}
