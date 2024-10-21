import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/loading_widget.dart';
import '../../../../auth_screens/widgets/common_widgets.dart';
import '../controller/add_service_providercontroller.dart';
import '../hospital_profile.dart';

addProviderDialog(
    {required BuildContext context,
    required AddServiceProvideController controller}) {
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.kcGreyColor.withOpacity(0.5),
                      ),
                      height: 48.h,
                      width: size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          16.w.horizontalSpace,
                          Expanded(
                            child: TextFormField(
                              onChanged: (val) {
                                controller.searchClinic(val);
                                if (val.isEmpty) {
                                  controller.searchClinics.clear();
                                }
                              },
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0xff64748B),
                              ),
                              controller: controller.searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search".tr,
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff64748B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16).h,
                        child: Obx(
                          () => SizedBox(
                            child: ListView.builder(
                                itemCount: controller.searchClinics.length,
                                itemBuilder: (context, index) {
                                  final clinic =
                                      controller.searchClinics[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12).h,
                                    child: SizedBox(
                                      height: size.height * 0.07,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () =>
                                                  HospitalProfileFromPatientSide(
                                                    isAdd: false,
                                                    model: controller
                                                        .searchClinics[index],
                                                    controller: controller,
                                                  ),
                                              transition:
                                                  Transition.rightToLeft,
                                              duration: const Duration(
                                                  milliseconds: 300));
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
                                                        BorderRadius.circular(
                                                            24.r),
                                                    color: AppColors
                                                        .kcPrimaryBlueColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      clinic.clinicName,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .kcPrimaryBlueColor),
                                                  shape: BoxShape.circle),
                                              height: 60,
                                              width: 60,
                                              // backgroundColor:
                                              //     AppColors.kcPrimaryBlueColor,

                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: CachedNetworkImage(
                                                  imageUrl: clinic
                                                          .profilePicture
                                                          .isEmpty
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
                    InkWell(
                      onTap: () {
                        controller.scanQrCode();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/icons/qr_text.svg",
                              height: 32.h),
                          SvgPicture.asset(
                            "assets/icons/qr.svg",
                            height: 56.h,
                          )
                        ],
                      ),
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

deleteClinic(
    {required BuildContext context,
    required ClinicModel clinic,
    required AddServiceProvideController controller}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          elevation: 50,
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24).w,
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
                      child: Text("Delete Provider?",
                          style: TextStyle(
                              fontSize: 18.sp,
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
                              controller.deleteProvider(clinic: clinic);
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
