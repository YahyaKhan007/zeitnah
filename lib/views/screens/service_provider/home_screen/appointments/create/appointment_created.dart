import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/screens/auth_screens/widgets/common_widgets.dart';

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
            Image.asset('assets/icons/splash_icon.png'),
            Text(
              "Appointment uploaded\nsuccessfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.kcPrimaryBlackColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            (size.height * 0.03).h.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.kcPrimaryBlueColor,
              ),
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
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
                  )),
                  CircleAvatar(
                    radius: 40.r,
                  )
                ],
              ),
            ),
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
