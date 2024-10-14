import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';
import 'package:zeitnah/views/widgets/formatting.dart';

import '../../utils/app_colors/app_colors.dart';
import '../views.dart';
import 'loading_widget.dart';

Widget appointmentDetailsContainer({
  required AppointmentModel appointment,
  required AppointmentControllerForClient controller,
  required BuildContext context,
}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(bottom: 16).h,
    child: GestureDetector(
      onTap: () {
        Get.to(() => const AcceptDeclineClientAppointments());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.kcPrimaryBlueColor,
        ),
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.only(bottom: 0.h, left: 16.w, right: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            8.h.verticalSpace,
            FutureBuilder(
                future:
                    controller.gettingClinicNameFromAppointment(appointment),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 24.h,
                      child: Center(
                        child: loadingWidgetInkDrop(
                          size: 16.r,
                          color: Colors.white24,
                        ),
                      ),
                    );
                  }
                  return Text(
                    snapshot.data!.clinicName.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  );
                }),
            8.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tileOption(
                      image: 'assets/icons/calender.svg',
                      title: formatDate(date: appointment.startTime!),
                    ),
                    tileOption(
                      image: 'assets/icons/clock.svg',
                      title:
                          "${formatTime(time: appointment.startTime!)} - ${formatTime(time: appointment.endTime!)}",
                    ),
                    tileOption(
                      image: 'assets/icons/user_box.svg',
                      title: appointment.workerName.toString(),
                    ),
                  ],
                )),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 38.r,
                  child: CircleAvatar(
                    radius: 37.r,
                    backgroundColor: AppColors.kcPrimaryBlueColor,
                    child: FutureBuilder(
                        future: controller
                            .gettingClinicNameFromAppointment(appointment),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: 24.h,
                              child: Center(
                                child: loadingWidgetInkDrop(
                                  size: 16.r,
                                  color: Colors.white24,
                                ),
                              ),
                            );
                          } else if (snapshot.data!.profilePicture.isEmpty) {
                            return SizedBox(
                                child:
                                    Image.asset('assets/icons/hospital.png'));
                          } else {
                            return Image.network(snapshot.data!.profilePicture);
                          }
                        }),

                    // appointment.cl
                    //   const AssetImage('assets/icons/hospital.png'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget tileOption({required String image, required String title}) {
  return SizedBox(
      height: 24.h,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              height: 18.r,
              color: Colors.white,
            ),
            16.w.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      )

      //   ListTile(
      //     contentPadding: EdgeInsets.zero,
      //     minVerticalPadding: 0,
      //     leading: SvgPicture.asset(
      //       image,
      //       height: 18.r,
      //       color: Colors.white,
      //     ),
      //     title: Text(
      //       title,
      //       style: TextStyle(
      //           color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),
      //     ),
      //   ),
      );
}
