import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_constants.dart';

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
                    SvgPicture.asset(
                      "assets/icons/back.svg",
                      color: AppColors.kcPrimaryBlueColor,
                    ),
                    // (size.height * 0.01).h.verticalSpace,
                    Center(
                      child: Text("Search Service Provider",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.murecho(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.kcPrimaryBlackColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                      height: 32.h,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.kcGreyColor.withOpacity(0.5)),
                      child: TextFormField(
                        style: TextStyle(
                            color:
                                AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color:
                                AppColors.kcPrimaryBlackColor.withOpacity(0.6),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8).h,
                        child: SizedBox(
                          child: ListView.builder(
                              itemCount: AppConstants.srviceProviderList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8).h,
                                  child: SizedBox(
                                    height: size.height * 0.08,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 24.w,
                                          right: 0,
                                          top: 8.h,
                                          child: Center(
                                            child: Container(
                                              height: size.height * 0.06,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24.r),
                                                color: AppColors
                                                    .kcPrimaryBlueColor,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  AppConstants
                                                      .srviceProviderList[index]
                                                      .name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 32.r,
                                          backgroundColor:
                                              AppColors.kcPrimaryBlueColor,
                                          backgroundImage: AssetImage(
                                              AppConstants
                                                  .srviceProviderList[index]
                                                  .image),
                                        ),
                                      ],
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
                        SvgPicture.asset("assets/icons/qr_text.svg"),
                        SvgPicture.asset("assets/icons/qr.svg")
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
