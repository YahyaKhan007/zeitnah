import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class HelpSupportProvider extends StatelessWidget {
  const HelpSupportProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).w,
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
          "Help & Support",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.kcPrimaryBlackColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          helpSupportOption(
              onTap: () {},
              label: "Write an email:",
              data: "support@zeitnah.io",
              size: size)
        ],
      ),
    );
  }

  Widget helpSupportOption(
      {required VoidCallback onTap,
      required String label,
      required String data,
      required Size size}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 40).h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 12.dg,
                  color: AppColors.kcGreyTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          8.h.verticalSpace,
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.r),
              border: Border.all(color: AppColors.kcGreyColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/help_support.svg',
                ),
                Text(
                  data,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.kcPrimaryBlackColor,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
