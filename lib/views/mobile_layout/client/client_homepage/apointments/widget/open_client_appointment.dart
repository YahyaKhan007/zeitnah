// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../../../widgets/appointment_detail_container.dart';
// import '../../../../../widgets/loading_widget.dart';
// import '../controller/appointment_controller_for_client.dart';
//
// class OpenClientAppointments extends StatelessWidget {
//   final AppointmentControllerForClient controller;
//   const OpenClientAppointments({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         child: Column(
//           children: [
//             16.h.verticalSpace,
//             Expanded(
//               child: Obx(
//                 () => controller.isLoading.value
//                     ? loadingWidgetInkDrop(size: 40, color: Colors.black)
//                     : controller
//                             .dataController.openAppointmentForPatient.isEmpty
//                         ? const Center(
//                             child: Text(
//                               "No Open Appointments",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           )
//                         : RefreshIndicator(
//                             onRefresh: () async {
//                               log("Refresh called");
//                             },
//                             child: CupertinoScrollbar(
//                               radius: const Radius.circular(40),
//                               thickness: 6,
//                               thumbVisibility: true,
//                               child: ListView.builder(
//                                 itemCount: controller.dataController
//                                     .openAppointmentForPatient.length,
//                                 itemBuilder: (context, index) {
//                                   final appointment = controller.dataController
//                                       .openAppointmentForPatient[index];
//
//                                   return appointmentDetailsContainer(
//                                       controller: controller,
//                                       context: context,
//                                       appointment: appointment);
//                                 },
//                               ),
//                             ),
//                           ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../widgets/appointment_detail_container.dart';
import '../../../../../widgets/loading_widget.dart';
import '../../my_time_calender/controller/my_calender_controller.dart';
import '../controller/appointment_controller_for_client.dart';

class OpenClientAppointments extends StatelessWidget {
  final AppointmentControllerForClient controller;

  OpenClientAppointments({super.key, required this.controller});

  final calendarController = Get.find<MyTimeCalendarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: Obx(
                () => calendarController.mute.value
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: const Text(
                            "UnMute Yourself if you wants to see the open appointments",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : controller.isLoading.value
                        ? Center(
                            child: loadingWidgetInkDrop(
                                size: 40, color: Colors.black))
                        : controller.dataController.openAppointmentForPatient
                                .isEmpty
                            ? RefreshIndicator(
                                onRefresh: _refreshAppointments,
                                child: SingleChildScrollView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(), // Ensures scrollability
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.72, // Make sure there's enough space to pull
                                    child: const Center(
                                      child: Text(
                                        "No Open Appointments",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : CupertinoScrollbar(
                                radius: const Radius.circular(40),
                                thickness: 6,
                                thumbVisibility: true,
                                child: RefreshIndicator(
                                  onRefresh: _refreshAppointments,
                                  child: ListView.builder(
                                    itemCount: controller.dataController
                                        .openAppointmentForPatient.length,
                                    itemBuilder: (context, index) {
                                      final appointment = controller
                                          .dataController
                                          .openAppointmentForPatient[index];

                                      return appointmentDetailsContainer(
                                          controller: controller,
                                          context: context,
                                          appointment: appointment);
                                    },
                                  ),
                                ),
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshAppointments() async {
    log("Refresh called");
    await controller.dbService
        .getAppointmentDataForPatient(controller: controller);
  }
}
