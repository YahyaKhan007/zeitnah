import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';

import 'appointment_views.dart';

class AppointmentHome extends GetView<AppointmentControllerForClient> {
  AppointmentHome({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appointmentAppbar(context: context, pageController: pageController),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OpenClientAppointments(
            controller: controller,
          ),
          AcceptedClientAppointment(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
