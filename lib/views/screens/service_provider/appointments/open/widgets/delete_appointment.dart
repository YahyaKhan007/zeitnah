import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/screens/auth_screens/widgets/common_widgets.dart';

deleteAppointment({required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (size.height * 0.03).h.verticalSpace,
                    Center(
                      child: Text("Delete Appointment?",
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.03).h.verticalSpace,
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.r, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.kcGreyColor),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              tileOption(
                                image: 'assets/icons/calender.svg',
                                title: "Today (05.08)",
                              ),
                              tileOption(
                                image: 'assets/icons/clock.svg',
                                title: "09:00 - 09:20",
                              ),
                              tileOption(
                                image: 'assets/icons/calender.svg',
                                title: "Peter Weiß",
                              ),
                            ],
                          )),
                          CircleAvatar(
                            radius: 40.r,
                          )
                        ],
                      ),
                    ),
                    (size.height * 0.02).h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlackColor,
                            textColor: Colors.white,
                            text: 'Yes',
                            size: size,
                            borderRadius: 48.r,
                            onTap: () {
                              Get.back();
                            }),
                        commonButtonWithLowWidth(
                            backGroundColor: AppColors.kcPrimaryBlueColor,
                            textColor: Colors.white,
                            text: 'No',
                            size: size,
                            borderRadius: 48.r,
                            onTap: () {
                              Get.back();
                            }),
                      ],
                    ),
                    (size.height * 0.02).h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget tileOption({required String image, required String title}) {
  return SizedBox(
    height: 32.h,
    child: ListTile(
      minVerticalPadding: 0,
      leading: SvgPicture.asset(
        image,
        height: 24.r,
        color: AppColors.kcPrimaryBlackColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.kcPrimaryBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300),
      ),
    ),
  );
}
