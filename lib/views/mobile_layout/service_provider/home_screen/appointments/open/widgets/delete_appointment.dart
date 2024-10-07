import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/open/controller/open_appointment_controller.dart';

import '../../../../../../../models/appointment_model/appointment_model.dart';
import '../../../../../../widgets/formatting.dart';
import '../../../../../auth_screens/widgets/common_widgets.dart';

deleteAppointment({
  required BuildContext context,
  required int index,
  required AppointmentModel appointment,
  required OpenAppointmentController controller,
}) {
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
                      child: Text("Delete Appointment?",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.03).h.verticalSpace,
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.r, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.kcGreyColor),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              tileOption(
                                image: 'assets/icons/calender.svg',
                                title: formatDate(date: appointment.startTime!),
                              ),
                              tileOption(
                                image: 'assets/icons/clock.svg',
                                title:
                                    '${formatTime(time: appointment.startTime!)} - ${formatTime(time: appointment.endTime!)}',
                              ),
                              tileOption(
                                image: 'assets/icons/calender.svg',
                                title: appointment.workerName.toString(),
                              ),
                            ],
                          )),
                          CircleAvatar(
                            radius: 32.r,
                            backgroundImage:
                                const AssetImage('assets/icons/hospital.png'),
                          )
                        ],
                      ),
                    ),
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
                              controller.deleteAppointment(
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

Widget tileOption({required String image, required String title}) {
  return SizedBox(
    height: 32.h,
    child: ListTile(
      minVerticalPadding: 0,
      leading: SvgPicture.asset(
        image,
        height: 20.r,
        color: AppColors.kcPrimaryBlackColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.kcPrimaryBlackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w300),
      ),
    ),
  );
}
