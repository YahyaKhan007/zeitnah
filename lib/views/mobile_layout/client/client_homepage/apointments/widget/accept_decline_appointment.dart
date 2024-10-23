import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/widgets/formatting.dart';
import 'package:zeitnah/views/widgets/loading_widget.dart';

import '../../../../../widgets/getting_pic_circle.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';
import '../../../client_views.dart';
import '../controller/appointment_controller_for_client.dart';

class AcceptDeclineClientAppointments extends StatelessWidget {
  final AppointmentModel appointment;
  final AppointmentControllerForClient controller;
  const AcceptDeclineClientAppointments(
      {super.key, required this.appointment, required this.controller});

  @override
  Widget build(BuildContext context) {
    // controller.startCountdown(appointment.startTime!);

    log(appointment.uid.toString());
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kcPrimaryBackgrundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16).w,
              child: GestureDetector(
                onTap: () {
                  controller.willRemoveAppointment(appointment);
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  color: AppColors.kcPrimaryBlueColor,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              "Appointment",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.kcPrimaryBlackColor,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('uid', isEqualTo: appointment.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: loadingWidgetInkDrop(
                        size: 30.r, color: AppColors.kcPrimaryBlackColor),
                  );
                }

                // Handle null or empty data
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "No appointment data found",
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    ),
                  );
                }

                // Safely access the first document
                var appointmentDoc = snapshot.data!.docs.first;
                Map<String, dynamic> mapAppointment = appointmentDoc.data();

                var thisAppointment = AppointmentModel.fromJson(mapAppointment);
                controller.observableAppointment.value = thisAppointment;

                return SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        16.h.verticalSpace,

                        FutureBuilder(
                            future: controller.gettingClinicNameFromAppointment(
                                thisAppointment),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: 16.h,
                                  child: Center(
                                    child: Text(
                                      "...",
                                      style: TextStyle(
                                          color: AppColors.kcPrimaryBlackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }
                              return Text(
                                snapshot.data!.clinicName.toString(),
                                style: TextStyle(
                                    color: AppColors.kcPrimaryBlackColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              );
                            }),
                        16.h.verticalSpace,

                        // it fetches the profile picture of the clinic
                        clinicProfilePicture(
                          appointment: thisAppointment,
                          controller: controller,
                          height: 120,
                          width: 120,
                        ),
                        16.h.verticalSpace,
                        remainingTime(),
                        16.h.verticalSpace,
                        appointmentDetails(thisAppointment: thisAppointment),
                        24.h.verticalSpace,

                        Visibility(
                            visible:
                                thisAppointment.acceptedBy == '' ? false : true,
                            child: Center(
                              child: Text(
                                "This Appointment is no longer available",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 12.sp),
                              ),
                            )),

                        Visibility(
                          visible:
                              thisAppointment.acceptedBy == '' ? true : false,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24).w,
                            child: commonFullSizeButton(
                                backGroundColor: AppColors.kcPrimaryBlueColor,
                                textColor: Colors.white,
                                text: "Accept Appointment",
                                // size: size,
                                borderRadius: 40.r,
                                onTap: () {
                                  acceptClientAppointment(
                                      context: context,
                                      onYes: () {
                                        controller.acceptTheOpenAppointment(
                                            appointment: thisAppointment);
                                      });
                                }),
                          ),
                        ),
                        16.h.verticalSpace,
                        Visibility(
                          visible:
                              thisAppointment.acceptedBy == '' ? true : false,
                          child: GestureDetector(
                            onTap: () {
                              rejectClientAppointment(
                                  context: context,
                                  onYes: () {
                                    controller.rejectAppointment(
                                        appointment: thisAppointment);
                                    log("reject clicked");
                                    Get.back();
                                    Get.back();
                                  });
                            },
                            child: SvgPicture.asset(
                              "assets/icons/cancel.svg",
                              height: size.height * 0.06,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        onWillPop: () async {
          controller.willRemoveAppointment(appointment);
          return true;
        });
  }

  Widget remainingTime() {
    return
        // Obx(
        // () =>

        Obx(() => controller.displayTimeGap(appointment.startTime!));

    // ),
  }

  Widget appointmentDetails({required AppointmentModel thisAppointment}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.kcGreyColor, width: 1),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              // spreadRadius: 4.r,
              blurRadius: 4,
              offset: const Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tileOption(
            image: 'assets/icons/calend.svg',
            title: formatDate(date: thisAppointment.startTime!),
          ),
          tileOption(
            image: 'assets/icons/Time.svg',
            title:
                '${formatTime(time: thisAppointment.startTime!)} - ${formatTime(time: thisAppointment.endTime!)}',
          ),
          tileOption(
            image: 'assets/icons/user_box.svg',
            title: "${thisAppointment.workerName}",
          ),
        ],
      ),
    );
  }

  Widget tileOption({required String image, required String title}) {
    return SizedBox(
      height: 28.h,
      child: ListTile(
        minVerticalPadding: 0,
        leading: SvgPicture.asset(
          image,
          height: 18.h,
          color: AppColors.kcGreyTextColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.kcGreyTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
