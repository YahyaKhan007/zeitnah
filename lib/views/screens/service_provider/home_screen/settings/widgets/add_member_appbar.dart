import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../setting_view.dart';

PreferredSize settingAppBar(
    {required TextEditingController controller,
    required String label,
    required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120.h),
    child: Container(
      decoration:
          BoxDecoration(color: AppColors.kcPrimaryBackgrundColor, boxShadow: [
        BoxShadow(
          color: AppColors.kcGreyTextColor.withOpacity(0.5),
          offset: const Offset(-1, 2),
          blurRadius: 10,
        )
      ]),
      padding:
          EdgeInsets.only(top: 32.h, bottom: 24.h, left: 16.w, right: 16.w),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  color: AppColors.kcPrimaryBlueColor,
                  height: 32.h,
                ),
              ),
              Center(
                child: Text(
                  label.tr,
                  style: GoogleFonts.openSans(
                      color: AppColors.kcPrimaryBlackColor,
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 24.w),
            ],
          ),
          16.h.verticalSpace,
          label.startsWith('P')
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kcGreyColor.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom : 8).h,
                    child: TextFormField(
                      controller: controller,
                      // textAlign: TextAlign.center,

                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kcPrimaryBlackColor),
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8.w, top: 4.h),
                            child: const Icon(
                              Icons.search,
                              color: AppColors.kcGreyTextColor,
                            ),
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kcGreyTextColor),
                          hintText: "Search"),
                    ),
                  ),
                )
              : addTeamMemberButton(
                  image: "assets/icons/add_member.svg",
                  label: "Add Members",
                  onTap: () {
                    addMember(context: context, nameController: controller);
                  })
        ],
      ),
    ),
  );
}

Widget addTeamMemberButton(
    {required VoidCallback onTap,
    required String label,
    required String image}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: AppColors.kcPrimaryBlueColor,
      ),
      height: 32.h,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 32).w,
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        
        children: [
          SvgPicture.asset(
            image,
            color: AppColors.kcPrimaryBackgrundColor,
            height: 24.h,
          ),
          // 24.w.horizontalSpace,
          Expanded(
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          24.w.horizontalSpace,
        ],
      ),
    ),
  );
}
