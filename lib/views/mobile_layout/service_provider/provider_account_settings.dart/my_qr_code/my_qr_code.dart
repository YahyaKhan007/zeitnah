import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../controller/account_setting_for_provider_controller.dart';

class MyQrCode extends StatelessWidget {
  final AccountSettingForProviderController controller;

  const MyQrCode({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        centerTitle: true,
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
            padding: const EdgeInsets.all(64).r, child: controller.myQrCode
            // SvgPicture.asset('assets/icons/my_qr_code.svg'),
            ),
      ),
    );
  }
}
