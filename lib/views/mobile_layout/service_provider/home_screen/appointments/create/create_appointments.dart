import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/create/controller/create_appointment_controller.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../views.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';
import '../app_view.dart';
// Create Appointments Page (Placeholder)

class CreateAppointments extends GetView<CreateAppointmentController> {
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
              controller: controller,
              image: 'assets/icons/calender.svg',
              label: 'Today',
              context: context,
              onTap: () {
                pickDate(context: context, controller: controller);
              },
            ),
            appointmentOption(
              controller: controller,
              image: 'assets/icons/Time.svg',
              label: 'Start Time',
              context: context,
              onTap: () {
                pickTime(
                    context: context,
                    label: 'Start Time',
                    controller: controller);
              },
            ),
            appointmentOption(
              controller: controller,
              image: 'assets/icons/Time.svg',
              label: 'End Time',
              context: context,
              onTap: () {
                // pickTime(
                //     context: context,
                //     label: 'End Time',
                //     controller: controller);
              },
            ),
            appointmentOption(
              controller: controller,
              image: 'assets/icons/user_box.svg',
              label: 'Select Worker (optional)',
              context: context,
              onTap: () {
                if (controller.dataController.providerTeamMembers.isEmpty) {
                  controller.snackBarService.showSnackBar(
                      color: AppColors.kcGreyTextColor,
                      message:
                          "There are no workers, Go to setting and add some",
                      duration: 1,
                      title: "No Worker");
                } else {
                  pickWorker(context: context, controller: controller);
                }
              },
            ),
            appointmentPriority(
              image: 'assets/icons/diomond.svg',
              label: 'Priority Function',
              context: context,
              onTap: () {},
              viewModelController: controller,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h),
              child: customFunctionalFullSizeButton(
                  isLoading: controller.isLoading,
                  size: size,
                  backGroundColor: AppColors.kcPrimaryBlueColor,
                  textColor: Colors.white,
                  text: "Update",
                  width: size.width * 0.8,
                  borderRadius: 40,
                  onTap: () {
                    controller.updateAppointment();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
