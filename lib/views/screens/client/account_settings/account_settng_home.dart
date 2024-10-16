import '../../../views.dart';
import 'package:get/get.dart';
import 'widgets/ui_functions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AccountSettingHomeForClient extends StatelessWidget {
  const AccountSettingHomeForClient({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Account Settings",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.kcPrimaryBlackColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          32.h.verticalSpace,
          settingoption(
              image: "assets/icons/personal_info.svg",
              label: "Personal Info",
              onTap: () {
                Get.to(() => const PersonalInfoScreen(),);
              }),
          settingoption(
              image: "assets/icons/help.svg",
              label: "Help & Support",
              onTap: () {
                Get.to(() => const HelpSupportProvider());
              }),
          settingoption(
              image: "assets/icons/logout.svg",
              label: "Logout",
              onTap: () {
                logoutDialog(context: context);
              }),
        ],
      ),
    );
  }

  Widget settingoption(
      {required String image,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24).h,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.r),
              border: Border.all(color: AppColors.kcGreyTextColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Row(
              children: [
                SvgPicture.asset(
                  image,
                  color: AppColors.kcPrimaryBlueColor,
                ),
                16.w.horizontalSpace,
                Text(label,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      color: AppColors.kcPrimaryBlackColor,
                      fontSize: 14.sp,
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
