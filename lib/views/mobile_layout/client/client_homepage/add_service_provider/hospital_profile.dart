import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';
import 'package:zeitnah/views/widgets/custome_button_with_icon.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import 'widgets/ui_functions.dart';

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
                child: CircleAvatar(
                  radius: 46.r,
                  backgroundColor: AppColors.kcPrimaryBlueColor,
                  // backgroundImage: AssetImage(widget.model.image),
                ),
              ),
              24.h.verticalSpace,
              profileFieldOption(
                  label: "Address",
                  data: model.address.isEmpty
                      ? "No Address"
                      : model.address.replaceAll("*", "/")),
              profileFieldOption(
                  label: "Phone Number",
                  data: model.phoneNumber.isEmpty
                      ? "No Phone Number"
                      : model.phoneNumber),
              profileFieldOption(label: "E-Mail", data: model.email),
              32.h.verticalSpace,
              isAdd
                  ? GestureDetector(
                      onTap: () {
                        deleteClinic(context: context, controller: controller);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/delet.svg",
                      ),
                    )
                  : Obx(
                      () => customButtonWithIconForSendRequest(
                          controller: controller,
                          backGroundColor: controller.isSend.value
                              ? AppColors.kcGreyTextColor
                              : AppColors.kcPrimaryBlueColor,
                          textColor: Colors.white,
                          text: "Add Service Provider",
                          size: size,
                          image: controller.isSend.value
                              ? null
                              : "assets/icons/add_member.svg",
                          imageColor: Colors.white,
                          borderRadius: 40.r,
                          onTap: () {
                            controller.isSend.value = !controller.isSend.value;
                            switch (controller.isSend.value) {
                              case true:
                                controller.sendRequest(model);
                                break;
                              case false:
                                controller.cancelRequest(model);

                                break;
                            }
                            // setState(() {});
                          }),
                    )
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
