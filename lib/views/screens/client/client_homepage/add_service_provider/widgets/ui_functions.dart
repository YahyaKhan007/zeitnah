import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/screens/client/client_homepage/add_service_provider/hospital_profile.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_constants.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';

addProviderDialog({required BuildContext context}) {
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
                height: size.height * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (size.height * 0.01).h.verticalSpace,
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/back.svg",
                        color: AppColors.kcPrimaryBlueColor,
                        height: 32.h,
                      ),
                    ),
                    // (size.height * 0.01).h.verticalSpace,
                    Center(
                      child: Text("Search Service Provider",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.murecho(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.kcPrimaryBlackColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    8.h.verticalSpace,
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      height: 32.h,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.kcGreyColor.withOpacity(0.5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 26.h,
                            child: TextFormField(
                              style: TextStyle(
                                  color:
                                      AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(top:6),
                                  child: Icon(
                                    Icons.search,
                                    color:
                                        AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                                  ),
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: AppColors.kcPrimaryBlackColor
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          4.h.verticalSpace,
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16).h,
                        child: SizedBox(
                          child: ListView.builder(
                              itemCount: AppConstants.srviceProviderList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12).h,
                                  child: SizedBox(
                                    height: size.height * 0.07,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Get.to(() => HospitalProfileFromPatientSide(
                                        //   isAdd: true,
                                        //   model: AppConstants
                                        //       .srviceProviderList[index],
                                        // ));
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 16.w,
                                            right: 20.w,
                                            top: 5.h,
                                            child: Center(
                                              child: Container(
                                                height: size.height * 0.055,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(24.r),
                                                  color: AppColors.kcPrimaryBlueColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    AppConstants
                                                        .srviceProviderList[index]
                                                        .name,
                                                    style:  TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 28.r,
                                            backgroundColor:
                                            AppColors.kcPrimaryBlueColor,
                                            backgroundImage: AssetImage(AppConstants
                                                .srviceProviderList[index].image),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Divider(
                        color: AppColors.kcGreyColor,
                      ),
                    ),
                    8.h.verticalSpace,

                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/qr_text.svg", height: 32.h),
                        SvgPicture.asset("assets/icons/qr.svg", height: 56.h,)
                      ],
                    ),
                    16.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

deleteHospital({required BuildContext context}) {
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
                              fontSize: 16.sp,
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    (size.height * 0.03).h.verticalSpace,
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
