import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../models/appointment_model/appointment_model.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/formatting.dart';
import '../../../../../widgets/loading_widget.dart';
import '../controller/appointment_controller_for_client.dart';

class AcceptedClientAppointment extends StatelessWidget {
  final AppointmentControllerForClient controller;
  const AcceptedClientAppointment({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: Obx(
                () => controller
                        .dataController.acceptedAppointmentForPatient.isEmpty
                    ? const Center(
                        child: Text(
                          "No Accepted Appointments",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : CupertinoScrollbar(
                        radius: const Radius.circular(40),
                        thickness: 6,
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: controller.dataController
                              .acceptedAppointmentForPatient.length,
                          itemBuilder: (context, index) {
                            final appointment = controller.dataController
                                .acceptedAppointmentForPatient[index];
                            return messageContainer(
                                context: context,
                                appointment: appointment,
                                controller: controller);
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageContainer({
    required BuildContext context,
    required AppointmentModel appointment,
    required AppointmentControllerForClient controller,
  }) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).h,
      child: GestureDetector(
        onTap: () {},
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                    radius: 32.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundColor: AppColors.kcPrimaryBlueColor,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 48.r,
                      ),
                    ),
                  ),
                  8.w.horizontalSpace,
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
        ));
  }
}
