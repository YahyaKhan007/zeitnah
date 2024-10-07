import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/appointments/create/controller/create_appointment_controller.dart';

import '../../../../auth_screens/widgets/common_widgets.dart';

class AppointmentCreated extends StatelessWidget {
  final String clinicName;
  final String date;
  final String appointmentTime;
  final String? worker;
  const AppointmentCreated({
    super.key,
    required this.clinicName,
    required this.date,
    required this.appointmentTime,
    this.worker,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (size.height * 0.06).h.verticalSpace,
            Image.asset(
              'assets/icons/splash_icon.png',
              height: size.height * 0.2,
            ),
            Text(
              "Appointment uploaded\nsuccessfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.kcPrimaryBlackColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            (size.height * 0.03).h.verticalSpace,
            appointmentDetailsContainer(context: context),
            (size.height * 0.03).h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: commonFullSizeButton(
                backGroundColor: AppColors.kcPrimaryBlueColor,
                textColor: Colors.white,
                text: "Continue",
                borderRadius: 50.r,
                onTap: () {
                  final controller = Get.find<CreateAppointmentController>();
                  controller.clearAppointmentDetails();
                  Get.back();
                  // Get.offAllNamed(
                  //     RouterHelperService.serviceProviderHomeScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentDetailsContainer({
    required BuildContext context,
  }) {
    final dataController = Get.find<ZeitnahDataController>();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).h,
      child: GestureDetector(
        // onTap: () {
        //   Get.to(() => const AcceptDeclineClientAppointments());
        // },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.kcPrimaryBlueColor,
          ),
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              8.h.verticalSpace,
              Text(
                dataController.currentLoggedInClinic.value!.clinicName
                    .toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              8.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tileOption(
                        image: 'assets/icons/calender.svg',
                        title: date,
                      ),
                      tileOption(
                        image: 'assets/icons/clock.svg',
                        title: appointmentTime,
                      ),
                      tileOption(
                        image: 'assets/icons/user_box.svg',
                        title: worker ?? '',
                      ),
                    ],
                  )),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 38.r,
                    child: CircleAvatar(
                      radius: 37.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          const AssetImage('assets/icons/hospital.png'),
                    ),
                  )
                ],
              ),
              8.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget tileOption({required String image, required String title}) {
    return SizedBox(
      height: 32.h,
      child: ListTile(
        minVerticalPadding: 0,
        leading: SvgPicture.asset(
          image,
          height: 24.r,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
