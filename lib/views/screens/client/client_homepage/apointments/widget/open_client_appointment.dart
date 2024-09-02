import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/screens/client/client_views.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/appointment_detail_container.dart';

class OpenClientAppointments extends StatelessWidget {
  const OpenClientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return appointmentDetailsContainer(context: context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
