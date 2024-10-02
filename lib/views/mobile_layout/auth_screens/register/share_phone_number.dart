import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

class SharePhoneNumber extends StatelessWidget {
  const SharePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/backImage.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Share Phone Number & E-Mail with your Service Provider?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.kcPrimaryBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                16.h.verticalSpace,
                Text(
                  "(Recommended for better communication)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.kcPrimaryBlackColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp),
                ),
                16.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.offNamed(RouterHelperService.clientHomeScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kcPrimaryBlueColor,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        width: size.width * 0.3,
                        height: 40.h,
                        child: Center(
                          child: Text(
                            "Yes",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                     
                     GestureDetector(
                       onTap: (){
                        Get.offAllNamed(RouterHelperService.clientHomeScreen);
                      },
                       child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        width: size.width * 0.3,
                        height: 40.h,
                        child: Center(
                          child: Text(
                            "No",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                                           ),
                     )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
