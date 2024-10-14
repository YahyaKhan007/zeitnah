import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';
import 'package:zeitnah/views/widgets/loading_widget.dart';

import 'add_pro_views.dart';
import 'widgets/add_pro_appbar.dart';
import 'widgets/ui_functions.dart';

class AddProviderHome extends GetView<AddServiceProvideController> {
  const AddProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: addProAppBar(context),
      body: Obx(
        () => SizedBox(
          height: size.height,
          width: size.width,
          child: controller.dataController.patientFollowedClinic.isEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(controller.dataController
                                    .patientFollowedClinic.length);
                              },
                              child:
                                  SvgPicture.asset("assets/icons/add_pro.svg"),
                            ),
                            Text(
                              "You Followed 0 Service Providers",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.kcPrimaryBlackColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    addClinicProvider(context),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller
                              .dataController.patientFollowedClinic.length,
                          itemBuilder: (context, index) {
                            final clinic = controller
                                .dataController.patientFollowedClinic[index];
                            return

                                // FutureBuilder(future: controller.getClinicFuture(uid: uid), builder: builder)
                                Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, right: 16.w, bottom: 16.h),
                              child: SizedBox(
                                height: size.height * 0.075,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => HospitalProfileFromPatientSide(
                                        controller: controller,
                                        isAdd: true,
                                        model: clinic,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 24.w,
                                        right: 0,
                                        top: 5.h,
                                        child: Center(
                                          child: Container(
                                            height: size.height * 0.06,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                              color:
                                                  AppColors.kcPrimaryBlueColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                clinic.clinicName,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        height: size.height * 0.1,
                                        width: size.width * 0.15,
                                        // backgroundColor:
                                        //     AppColors.kcPrimaryBlueColor,

                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl: clinic
                                                    .profilePicture.isEmpty
                                                ? 'https://www.iconfinder.com/icons/8581109/unknown_user_avatar_profile_person_account_human_icon'
                                                : clinic.profilePicture,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: loadingWidgetInkDrop(
                                                  size: 20,
                                                  color: Colors
                                                      .black), // Loading indicator
                                            ),
                                          ),
                                        ),
                                        // backgroundImage:
                                        // AssetImage(AppConstants
                                        //     .srviceProviderList[index].image),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    addClinicProvider(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget addClinicProvider(BuildContext context) {
    return Container(
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
          6.h.verticalSpace,
          GestureDetector(
            onTap: () {
              addProviderDialog(
                controller: controller,
                context: context,
              );
            },
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/add_pro.svg",
                height: 48.r,
              ),
            ),
          ),
          Text(
            "Add Service Provider",
            style: TextStyle(
                color: AppColors.kcPrimaryBlackColor,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
          ),
          16.h.verticalSpace,
        ],
      ),
    );
  }
}
