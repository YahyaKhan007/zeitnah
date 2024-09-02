import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import '../../../../../widgets/appoint_container_widget.dart';
import 'widgets/delete_appointment.dart';

class OpenAppointments extends StatelessWidget {
  const OpenAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      child: Column(
        children: [
          openAppointmentContainerWidget(
              date: 'Today (05.08)',
              onDelete: () {
                deleteAppointment(context: context);
              },
              time: '9:00 - 9:20',
              size: size),
          openAppointmentContainerWidget(
              date: 'Today (05.08)',
              onDelete: () {
                deleteAppointment(context: context);
              },
              time: '18:00 - 18:20',
              size: size),
        ],
      ),
    ));
  }


}
