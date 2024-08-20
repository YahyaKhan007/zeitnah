import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/screens/auth_screens/widgets/common_widgets.dart';

import '../../../client_views.dart';

class AcceptDeclineClientAppointments extends StatelessWidget {
  const AcceptDeclineClientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12).w,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              color: AppColors.kcPrimaryBlueColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Appointment",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.kcPrimaryBlackColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.h.verticalSpace,
              Text(
                "Bilal Hospital",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.kcPrimaryBlackColor,
                        fontWeight: FontWeight.bold)),
              ),
              16.h.verticalSpace,
              CircleAvatar(
                  radius: 56.r,
                  backgroundColor: AppColors.kcPrimaryBlueColor,
                  backgroundImage:
                      const AssetImage("assets/icons/hospital.png")),
              16.h.verticalSpace,
              remainingTime(),
              16.h.verticalSpace,
              appointmentDetails(),
              16.h.verticalSpace,
              commonButton(
                  backGroundColor: AppColors.kcPrimaryBlueColor,
                  textColor: Colors.white,
                  text: "Accept Appointment",
                  size: size,
                  borderRadius: 40.r,
                  onTap: () {
                    acceptClientAppointment(context: context, onYes: () {});
                  }),
              16.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  rejectClientAppointment(context: context, onYes: () {});
                },
                child: SvgPicture.asset(
                  "assets/icons/cancel.svg",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget remainingTime() {
    return Text(
      "35:49 min",
      style: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: 30.sp,
            color: AppColors.kcGreyTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget appointmentDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kcGreyColor, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          tileOption(
            image: 'assets/icons/calender.svg',
            title: "Today (05.08)",
          ),
          tileOption(
            image: 'assets/icons/clock.svg',
            title: "09:00 - 09:20",
          ),
          tileOption(
            image: 'assets/icons/calender.svg',
            title: "Peter Weiß",
          ),
        ],
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
          color: AppColors.kcGreyTextColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.kcGreyTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
