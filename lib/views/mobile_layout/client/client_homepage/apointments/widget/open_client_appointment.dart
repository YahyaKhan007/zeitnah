import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';

import '../../../../../widgets/appointment_detail_container.dart';

class OpenClientAppointments extends StatelessWidget {
  final AppointmentControllerForClient controller;
  const OpenClientAppointments({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: Obx(
                () =>
                    controller.dataController.openAppointmentForPatient.isEmpty
                        ? const Center(
                            child: Text(
                              "No Open Appointments",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        : CupertinoScrollbar(
                            radius: const Radius.circular(40),
                            thickness: 6,
                            thumbVisibility: true,
                            child: ListView.builder(
                              itemCount: controller.dataController
                                  .openAppointmentForPatient.length,
                              itemBuilder: (context, index) {
                                final appointment = controller.dataController
                                    .openAppointmentForPatient[index];

                                // controller.dataController.allClinic.forEach(action)

                                return appointmentDetailsContainer(
                                    controller: controller,
                                    context: context,
                                    appointment: appointment);
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
}
