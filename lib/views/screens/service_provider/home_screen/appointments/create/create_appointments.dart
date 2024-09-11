import '../app_view.dart';
import 'package:get/get.dart';
import '../../../../../views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';
// Create Appointments Page (Placeholder)


class CreateAppointments extends StatelessWidget {
  const CreateAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appointmentOption(
              image: 'assets/icons/calender.svg',
              label: 'Today',
              context: context,
              onTap: () {
                pickDate(context: context);
              },
            ),
            appointmentOption(
              image: 'assets/icons/Time.svg',
              label: 'Start Time',
              context: context,
              onTap: () {
                pickTime(context: context, label: 'Start Time');
              },
            ),
            appointmentOption(
              image: 'assets/icons/Time.svg',
              label: 'End Time',
              context: context,
              onTap: () {
                pickTime(context: context, label: 'Start Time');
              },
            ),
            appointmentOption(
              image: 'assets/icons/user_box.svg',
              label: 'Select Worker (optional)',
              context: context,
              onTap: () {
                pickWorker(context: context);
              },
            ),
            appointmentPriority(
              image: 'assets/icons/diomond.svg',
              label: 'Priority Function',
              context: context,
              onTap: () {
               
               
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h),
              child: commonFullSizeButton(
                  backGroundColor: AppColors.kcPrimaryBlueColor,
                  textColor: Colors.white,
                  text: "Update",
                  width: size.width * 0.8,
                  borderRadius: 40,
                  onTap: () {
                    Get.toNamed(RouterHelperService.appointmentCreated);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
