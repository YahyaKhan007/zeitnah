import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/appointment_detail_container.dart';



class OpenClientAppointments extends StatelessWidget {
  const OpenClientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
        radius: const Radius.circular(40),
        thickness: 6,
        thumbVisibility: true,
        child: SizedBox(
          child: Column(
            children: [
              16.h.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return appointmentDetailsContainer(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
