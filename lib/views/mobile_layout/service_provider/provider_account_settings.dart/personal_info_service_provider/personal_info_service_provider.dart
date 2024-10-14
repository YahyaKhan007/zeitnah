import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/provider_account_settings.dart/controller/account_setting_for_provider_controller.dart';
import 'package:zeitnah/views/widgets/loading_widget.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/custome_button_with_icon.dart';
import '../../../../widgets/profile_option_edit.dart';
import '../../../client/account_settings/widgets/ui_functions.dart';

class PersonalInfoServiceProviderScreen extends StatelessWidget {
  final AccountSettingForProviderController controller;
  const PersonalInfoServiceProviderScreen(
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kcPrimaryBackgrundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: GestureDetector(
              onTap: controller.onBack,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                color: AppColors.kcPrimaryBlueColor,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Personal Info",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: CupertinoScrollbar(
          thumbVisibility: true,
          radius: Radius.circular(32.r),
          thickness: 4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.h.verticalSpace,
                InkWell(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: SizedBox(
                    height: size.height * 0.15,
                    child: Stack(
                      children: [
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                shape: BoxShape.circle),
                            // height: size.height * 0.065,
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  controller.dataController.imageLoading.value
                                      ? loadingWidgetInkDrop(
                                          size: 20, color: Colors.black)
                                      : controller
                                              .dataController
                                              .currentLoggedInClinic!
                                              .value!
                                              .profilePicture
                                              .isEmpty
                                          ? Image.asset(
                                              'assets/icons/hospital.png',
                                              fit: BoxFit.cover,
                                            )
                                          : CachedNetworkImage(
                                              useOldImageOnUrlChange: true,
                                              imageUrl: controller
                                                  .dataController
                                                  .currentLoggedInClinic!
                                                  .value!
                                                  .profilePicture,
                                              fit: BoxFit.cover,
                                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                16.h.verticalSpace,
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Clinic Name",
                    data: "Eduard",
                    controller: controller.nameController),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "City",
                    data: "city",
                    controller: controller.cityController),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Street",
                    data: "street",
                    controller: controller.streetController),
                profileOptionWithNoEdit(
                  size: size,
                  onTap: () {},
                  label: "E-Mail",
                  data: controller
                      .dataController.currentLoggedInClinic.value!.email,
                ),
                profileOptionEdit(
                    size: size,
                    onTap: () {},
                    label: "Phone Number",
                    data: "+4912312312312",
                    controller: controller.phoneNumberController),
                24.h.verticalSpace,
                customeButtonWithIcon(
                    backGroundColor: Colors.white,
                    textColor: AppColors.kcPrimaryBlackColor,
                    text: "Delete Account",
                    size: size,
                    image: "assets/icons/delete_icon.svg",
                    // imageColor: Colors.transparent,
                    borderRadius: 48.r,
                    onTap: () {
                      deleteAccount(context: context, controller: controller);
                    }),
                24.h.verticalSpace,
              ],
            ),
          ),
        ));
  }
}
