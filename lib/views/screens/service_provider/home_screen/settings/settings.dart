import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import 'widgets/functions.dart';

class ServiceProviderSettings extends StatelessWidget {
  const ServiceProviderSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          (size.height * 0.05).verticalSpace,
          settingOption(
              onTap: () {
                Get.toNamed(RouterHelperService.addTeamMember);
              },
              image: 'assets/icons/add_member.svg',
              label: 'Team Member',
              trailingText: '3'),
          settingOption(
              onTap: () {
                Get.toNamed(RouterHelperService.priorityList);
              },
              image: 'assets/icons/diomond.svg',
              label: 'Priority List',
              trailingText: '5'),
          settingOption(
              onTap: () {
                selectDefaultTime(context: context);
              },
              image: 'assets/icons/clock_1.svg',
              label: 'Team Member',
              trailingText: '20min'),
        ],
      ),
    );
  }

  Widget settingOption(
      {required String image,
      required String label,
      required VoidCallback onTap,
      required String trailingText}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.kcGreyColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(children: [
          SvgPicture.asset(
            image,
            color: AppColors.kcPrimaryBlueColor,
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.kcPrimaryBlackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Text(trailingText,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold)))
        ]),
      ),
    );
  }
}
