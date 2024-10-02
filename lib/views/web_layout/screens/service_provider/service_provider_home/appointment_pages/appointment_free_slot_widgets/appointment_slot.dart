import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/service_provider_home/appointment_pages/appointment_free_slot_widgets/controller/appoint_slot_controller.dart';

import '../../../../../constants/app_colors/app_colors.dart';
import 'priority_widget.dart';

class AppointmentSlot extends GetView<AppointmentFreeSlotController> {
  const AppointmentSlot({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: size.width * 0.1),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: size.width * 0.37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      offset: const Offset(0, 0),
                      blurRadius: 3),
                ],
                color: AppColors.kcPrimaryWhite),
            child: SingleChildScrollView(
              // Add scroll if contents inside are too long
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Appointment Free Slot",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: AppColors.kcPrimaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    const SizedBox(height: 16),
                    AppointmentOptionWidget(
                      controller: controller,
                      image: 'assets/icons/date.svg',
                      label: "Date",
                    ),
                    AppointmentOptionWidget(
                      controller: controller,
                      image: 'assets/icons/start_time.svg',
                      label: "Start Time",
                    ),
                    AppointmentOptionWidget(
                      controller: controller,
                      image: 'assets/icons/stop_time.svg',
                      label: "End Time",
                    ),
                    AppointmentOptionWidget(
                      controller: controller,
                      image: 'assets/icons/user.svg',
                      label: "Select Doctor (Optional)",
                    ),
                    const PriorityWidget(),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        log(size.height.toString());
                        log(size.width.toString());
                      },
                      child: customButtom(
                          size: size,
                          color: AppColors.kcPrimaryColor,
                          buttonSize: size.width * 0.12,
                          label: "Update"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentOptionWidget extends StatelessWidget {
  final String image;
  final String label;

  final AppointmentFreeSlotController controller;

  const AppointmentOptionWidget(
      {super.key,
      required this.image,
      required this.label,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.06,
      height: 48,
      margin: const EdgeInsets.only(bottom: 24),
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.kcgreyFieldColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(image,
              height: 28, color: AppColors.kcPrimaryColor), // Image.asset(
          //   image,
          //   color: Colors.blueAccent,
          // ),
          title: Text(
            label,
            style: const TextStyle(
                color: AppColors.kcPrimaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
