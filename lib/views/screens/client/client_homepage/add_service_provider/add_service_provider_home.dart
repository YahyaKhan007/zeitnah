import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';
import 'package:zeitnah/views/screens/client/client_homepage/add_service_provider/widgets/add_pro_appbar.dart';

import 'add_pro_views.dart';
import 'widgets/ui_functions.dart';

class AddProviderHome extends StatelessWidget {
  const AddProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: addProAppBar(context),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: AppConstants.srviceProviderList.isEmpty
            ? Center(
                child: GestureDetector(
                    child: SvgPicture.asset("assets/icons/add_pro.svg")))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: AppConstants.srviceProviderList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 24.w, right: 16.w, bottom: 16.h),
                            child: SizedBox(
                              height: size.height * 0.08,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => HospitalProfileFromPatientSide(
                                        isAdd: true,
                                        model: AppConstants
                                            .srviceProviderList[index],
                                      ));
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 24.w,
                                      right: 0,
                                      top: 5.h,
                                      child: Center(
                                        child: Container(
                                          height: size.height * 0.07,
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
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.kcPrimaryBackgrundColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kcGreyTextColor.withOpacity(0.2),
                          offset: const Offset(0, -10),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addProviderDialog(
                              context: context,
                            );
                          },
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/add_pro.svg",
                              height: 64.r,
                            ),
                          ),
                        ),
                        Text(
                          "Add Service Provider",
                          style: TextStyle(
                              color: AppColors.kcPrimaryBlackColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
