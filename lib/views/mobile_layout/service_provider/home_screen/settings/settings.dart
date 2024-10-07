import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/settings/controller/provider_setting_controller.dart';

import '../../../../../services/services.dart';
import '../../../../views.dart';

class ServiceProviderSettings extends GetView<ProviderSettingController> {
  const ServiceProviderSettings({super.key});

  @override
  Widget build(BuildContext context) {
    controller.customPriorityTimeForClinicAppointment.value = controller
        .dataController.currentLoggedInClinic.value!.customTimeForAppointment;
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
          ),
          settingOption(
            onTap: () {
              selectCustomTimeForClinicAppointment(
                  context: context, controller: controller);
            },
            image: 'assets/icons/clock_1.svg',
            label: 'Custom Time',
          ),
        ],
      ),
    );
  }

  Widget settingOption({
    required String image,
    required String label,
    required VoidCallback onTap,
  }) {
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SvgPicture.asset(
            image,
            color: AppColors.kcPrimaryBlueColor,
            height: 24.h,
          ),
          Expanded(
            child: SizedBox(
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.kcPrimaryBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Center(
              child: controller.showTrailingText(label),
            ),
          )
        ]),
      ),
    );
  }
}
