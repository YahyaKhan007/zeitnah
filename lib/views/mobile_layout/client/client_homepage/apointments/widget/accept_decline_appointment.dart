import 'package:get/get.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';
import '../../../client_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AcceptDeclineClientAppointments extends StatelessWidget {
  const AcceptDeclineClientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16).w,
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
                  fontSize: 16.sp,
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
                        fontSize: 16.sp,
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
              24.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: commonFullSizeButton(
                    backGroundColor: AppColors.kcPrimaryBlueColor,
                    textColor: Colors.white,
                    text: "Accept Appointment",
                    // size: size,
                    borderRadius: 40.r,
                    onTap: () {
                      acceptClientAppointment(context: context, onYes: () {});
                    }),
              ),
              16.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  rejectClientAppointment(context: context, onYes: () {});
                },
                child: SvgPicture.asset(
                  "assets/icons/cancel.svg",
                  height: size.height * 0.06,
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
            fontSize: 22.sp,
            color: AppColors.kcGreyTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget appointmentDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.kcGreyColor, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400,
          // spreadRadius: 4.r,
          blurRadius: 4,
          offset: const Offset(0, 0)
          )
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tileOption(
            image: 'assets/icons/calend.svg',
            title: "Today (05.08)",
          ),
          tileOption(
            image: 'assets/icons/Time.svg',
            title: "09:00 - 09:20",
          ),
          tileOption(
            image: 'assets/icons/user_box.svg',
            title: "Peter Weiß",
          ),
        ],
      ),
    );
  }

  Widget tileOption({required String image, required String title}) {
    return SizedBox(
      height: 28.h,
      child: ListTile(
        minVerticalPadding: 0,
        leading: SvgPicture.asset(
          image,
          height: 18.h,
          color: AppColors.kcGreyTextColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.kcGreyTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
