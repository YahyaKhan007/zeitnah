import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import '../../../../../services/services.dart';
import 'widgets/custome_notifications.dart';
import 'widgets/my_calender_appbar.dart';

class MyCalender extends StatelessWidget {
  const MyCalender({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahController>();
    return Scaffold(
      appBar: myCalenderAppbar(context),
      body: Obx(
        () => controller.always.value == true
            ? always(size: size)
            : controller.mute.value == true
                ? mute(size: size)
                : customeNotification(context: context),
      ),
    );
  }

  Widget always({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/always.svg",
            height: size.height * 0.1,
          ),
          4.h.verticalSpace,
          Text(
            "You get all\nNotifications",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kcPrimaryBlackColor)),
          )
        ],
      ),
    );
  }

  Widget mute({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/mute.svg",
            height: size.height * 0.1,
          ),
          4.h.verticalSpace,
          Text(
            "You get no\nNotifications",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kcPrimaryBlackColor)),
          )
        ],
      ),
    );
  }
}
