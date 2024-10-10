import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/accepted/controller/accepted_appointment_controller.dart';
import 'package:zeitnah/views/widgets/formatting.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../app_view.dart';

class AcceptedAppointments extends GetView<AcceptedAppointmentController> {
  const AcceptedAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
      () => controller.dataController.providerAcceptedAppointment.isEmpty
          ? Center(
              child: Text(
                'No Accepted Appointments',
                style: TextStyle(
                    fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
              ),
            )
          : ListView.builder(
              itemCount:
                  controller.dataController.providerAcceptedAppointment.length,
              itemBuilder: (context, index) {
                final appointment = controller
                    .dataController.providerAcceptedAppointment[index];

                return cancelAppointment(
                    date: formatDate(date: appointment.startTime!),
                    drName: appointment.workerName.toString(),
                    time:
                        '${formatTime(time: appointment.startTime!)} - ${formatTime(time: appointment.endTime!)}',
                    onCancel: () {
                      confirmCancelAppointment(
                          context: context,
                          appointment: appointment,
                          controller: controller);
                    },
                    size: size);
              }),
    ));
  }
}

Widget cancelAppointment({
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
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onCancel,
                child: CircleAvatar(
                  backgroundColor: AppColors.kcPrimaryBlackColor,
                  radius: 12.r,
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}
