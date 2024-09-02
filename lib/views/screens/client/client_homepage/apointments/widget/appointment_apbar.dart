import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../services/services.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../account_settings/account_settng_home.dart';

PreferredSizeWidget appointmentAppbar(
    {required BuildContext context, required PageController pageController}) {
  Size size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(140.h),
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
                "Messages".tr,
                style: GoogleFonts.openSans(
                    color: AppColors.kcPrimaryBlackColor,
                    textStyle: TextStyle(
                        color: AppColors.kcPrimaryBlackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=> const AccountSettingHomeForClient(), duration: const Duration(milliseconds: 500));
                },
                child: Image.asset(
                  'assets/icons/menu.png',
                  color: Colors.black,
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
    height: 40.h,
    width: size.width,
    margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
      color: const Color(0xffE4E4E4),
    ),
    child: Row(
      children: [
        selectedTab(
          controller: controller,
          label: "Open",
          tabIndex: 0,
          pageController: pageController,
        ),
        selectedTab(
          controller: controller,
          label: "Accepted",
          tabIndex: 1,
          pageController: pageController,
        ),
      ],
    ),
  );
}

Widget selectedTab({
  required int tabIndex,
  required ZeitnahController controller,
  required String label,
  required PageController pageController,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        controller.selectClientMessagetab.value = tabIndex;
        pageController.jumpToPage(tabIndex);
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: controller.selectClientMessagetab.value == tabIndex
                ? AppColors.kcPrimaryBackgrundColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: [
              BoxShadow(
                color: controller.selectClientMessagetab.value == tabIndex
                    ? Colors.grey
                    : Colors.transparent,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
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
      ),
    ),
  );
}
