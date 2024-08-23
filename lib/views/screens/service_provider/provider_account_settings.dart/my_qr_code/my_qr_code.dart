import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors/app_colors.dart';

class MyQrCode extends StatelessWidget {
  const MyQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        centerTitle: true,
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
        title: Text(
          "My QR-Code".tr,
          style: GoogleFonts.openSans(
              color: AppColors.kcPrimaryBlackColor,
              textStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SvgPicture.asset('assets/icons/my_qr_code.svg'),
        ),
      ),
    );
  }
}
