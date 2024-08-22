import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors/app_colors.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Personal Info",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.kcPrimaryBlackColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
