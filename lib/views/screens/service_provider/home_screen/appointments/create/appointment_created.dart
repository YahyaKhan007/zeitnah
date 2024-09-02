import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/screens/auth_screens/widgets/common_widgets.dart';

import '../../../../../widgets/appoint_container_widget.dart';
import '../../../../../widgets/appointment_detail_container.dart';

class AppointmentCreated extends StatelessWidget {
  const AppointmentCreated({super.key});

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
            Image.asset('assets/icons/splash_icon.png', height: size.height * 0.2,),
            Text(
              "Appointment uploaded\nsuccessfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.kcPrimaryBlackColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            (size.height * 0.03).h.verticalSpace, appointmentDetailsContainer(context: context),
            (size.height * 0.03).h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              child: commonFullSizeButton(
                backGroundColor: AppColors.kcPrimaryBlueColor,
                textColor: Colors.white,
                text: "Continue",
                borderRadius: 50.r,
                onTap: () {
                  Get.back();
                },
              ),
            )
          ],
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
