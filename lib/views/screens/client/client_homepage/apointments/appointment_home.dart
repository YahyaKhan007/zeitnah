import 'appointment_views.dart';
import 'package:flutter/material.dart';


class AppointmentHome extends StatelessWidget {
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
        children: const [
          OpenClientAppointments(),
          AcceptedClientAppointment(),
        ],
      ),
    );
  }
}
