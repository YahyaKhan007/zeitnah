import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/open/controller/open_appointment_controller.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/open/widgets/delete_appointment.dart';
import 'package:zeitnah/views/web_layout/constants/app_colors/app_colors.dart';

import '../../../../../widgets/appoint_container_widget.dart';
import '../../../../../widgets/formatting.dart';

class OpenAppointments extends GetView<OpenAppointmentController> {
  const OpenAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
      () => controller.zeitnahDataController.providerOpenAppointment.isEmpty
          ? Center(
              child: Text(
                'No currently Open Appointments',
                style: TextStyle(
                    fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
              ),
            )
          : ListView.builder(
              itemCount: controller
                  .zeitnahDataController.providerOpenAppointment.length,
              itemBuilder: (context, index) {
                final appointment = controller
                    .zeitnahDataController.providerOpenAppointment[index];
                return openAppointmentContainerWidget(
                    date: formatDate(date: appointment.startTime!),
                    onDelete: () {
                      deleteAppointment(
                        context: context,
                        index: index,
                        appointment: appointment,
                        controller: controller,
                      );
                    },
                    time:
                        '${formatTime(time: appointment.startTime!)} - ${formatTime(time: appointment.endTime!)}',
                    size: size);
              }),
    ));
  }
}
