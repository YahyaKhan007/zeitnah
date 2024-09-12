import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../services/services.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../account_settings/account_settng_home.dart';

PreferredSizeWidget appointmentAppbar(
    {required BuildContext context, required PageController pageController}) {
  Size size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.22),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.kcPrimaryBackgrundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kcGreyTextColor.withOpacity(0.5),
            offset: const Offset(-1, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          32.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Appointments".tr,
                style: GoogleFonts.openSans(
                    color: AppColors.kcPrimaryBlackColor,
                    textStyle: TextStyle(
                        color: AppColors.kcPrimaryBlackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20).w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const AccountSettingHomeForClient(),
                      // transition: Transition.rightToLeftWithFade,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/three_bar.svg',
                    height: size.height * 0.04,
                  ),
                ),
              ),
            ],
          ),
          16.h.verticalSpace,
          topBar(pageController: pageController, size: size),
          8.h.verticalSpace,
        ],
      ),
    ),
  );
}

Widget topBar({required Size size, required PageController pageController}) {
  final controller = Get.find<ZeitnahController>();
  return Container(
    // height: size.height * 0.055,
    height: 32.h,
    width: size.width,
    margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
      color: const Color(0xffE4E4E4),
    ),
    child: Stack(
      children: [
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: controller.selectClientMessagetab.value * (size.width / 2.32),
            width: size.width / 2.32,
            height: 32.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kcPrimaryBackgrundColor,
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 6,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            selectedTab(
              size: size,
              controller: controller,
              label: "Open",
              tabIndex: 0,
              pageController: pageController,
            ),
            selectedTab(
              size: size,
              controller: controller,
              label: "Accepted",
              tabIndex: 1,
              pageController: pageController,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget selectedTab({
  required int tabIndex,
  required Size size,
  required ZeitnahController controller,
  required String label,
  required PageController pageController,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      controller.selectClientMessagetab.value = tabIndex;
      pageController.jumpToPage(tabIndex);
    },
    child: SizedBox(
      height: 32.h,
      width: size.width / 2.32,
      child: Center(
        child: Text(
          label.tr,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: AppColors.kcPrimaryBlackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  );
}
