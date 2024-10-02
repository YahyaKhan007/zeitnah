import 'package:flutter/material.dart';

import 'appointment_free_slot_widgets/appointment_slot.dart';
import 'widgets/topBar_options.dart';

class AppointmentFreeSlot extends StatelessWidget {
  const AppointmentFreeSlot({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: size.width * 0.11),
            // color: Colors.red,
            height: 48,
            width: size.width * 0.34,
            child: serviceProviderOptions(context: context)),
        const SizedBox(height: 8),
        const AppointmentSlot(),
      ],
    );
  }
}
