import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/loading_widget.dart';

class HospitalProfileFromPatientSide extends StatelessWidget {
  final ClinicModel model;
  final bool isAdd;
  final AddServiceProvideController controller;
  HospitalProfileFromPatientSide(
      {super.key,
      required this.model,
      required this.isAdd,
      required this.controller});

  bool isSend = false;
  @override
  Widget build(BuildContext context) {
    log('already Requested : ${controller.dataController.requestedClinicIds.contains(model.uid)}');
    log('Liked : ${controller.dataController.followedClinicIds.contains(model.uid)}');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              color: AppColors.kcPrimaryBlueColor,
            ),
          ),
        ),
        title: Text(
          model.clinicName,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: AppColors.kcPrimaryBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 48.r,
                backgroundColor: AppColors.kcPrimaryBlackColor,
                child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: size.height * 0.13,
                  width: size.height * 0.13,
                  // backgroundColor:
                  //     AppColors.kcPrimaryBlueColor,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: model.profilePicture.isEmpty
                          ? 'https://www.iconfinder.com/icons/8581109/unknown_user_avatar_profile_person_account_human_icon'
                          : model.profilePicture,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: loadingWidgetInkDrop(
                            size: 20, color: Colors.black), // Loading indicator
                      ),
                    ),
                  ),
                  // backgroundImage:
                  // AssetImage(AppConstants
                  //     .srviceProviderList[index].image),
                ),
              ),
              24.h.verticalSpace,
              profileFieldOption(
                  label: "Address",
                  data: model.address.isEmpty
                      ? "No Address"
                      : model.address.replaceAll("*", "/")),
              InkWell(
                onTap: () {
                  log(controller.dataController.requestedClinicIds.length
                      .toString());
                },
                child: profileFieldOption(
                    label: "Phone Number",
                    data: model.phoneNumber.isEmpty
                        ? "No Phone Number"
                        : model.phoneNumber),
              ),
              profileFieldOption(label: "E-Mail", data: model.email),
              32.h.verticalSpace,
              Obx(() => controller.multipleFunctionalButtonForClinicProfile(
                  clinicModel: model, context: context, size: size)),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileFieldOption({
    required String label,
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: AppColors.kcGreyTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ),
          8.h.verticalSpace,
          Container(
            height: 32.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.kcGreyColor,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Text(
                data,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
