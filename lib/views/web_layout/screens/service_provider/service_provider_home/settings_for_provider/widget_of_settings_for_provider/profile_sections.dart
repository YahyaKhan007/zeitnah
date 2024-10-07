import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../../constants/app_colors/app_colors.dart';
import '../../appointment_pages/appointment_free_slot_widgets/priority_widget.dart';
import 'provider_textfield_with_label.dart';

class ProfileSectionWidget extends StatelessWidget {
  ProfileSectionWidget({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: size.width * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kcPrimaryWhite),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Profile",
                style: TextStyle(
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            profileRowWidget(size: size),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: size.width * 0.03,
                runSpacing: size.height * 0.02,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  ProviderTextfieldWithLabelWidget(
                    controller: nameController,
                    editable: false,
                    hintText: 'Azeem Khalid',
                    label: 'Name',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: addressController,
                    editable: false,
                    hintText: '',
                    label: 'Address',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: emailController,
                    editable: false,
                    hintText: 'random.person@gmail.com',
                    label: 'Email',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: passwordController,
                    editable: false,
                    hintText: '11223344',
                    label: 'Password',
                    isPassword: true,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: phoneNumberController,
                    editable: false,
                    hintText: '+923121234567',
                    label: 'Phone Number',
                    isPassword: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileRowWidget({required Size size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: size.height * 0.04,
                backgroundImage:
                    const AssetImage('assets/images/profile_pic.png'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Bilal Hospital",
                    style: TextStyle(
                        fontFamily: 'helvetica',
                        fontSize: 14,
                        color: AppColors.kcPrimaryTextColor),
                  ),
                  Text(
                    "alexarawles@gmail.com",
                    style: TextStyle(
                        fontFamily: 'helvetica',
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kcgreyFieldColor.withOpacity(0.6)),
                  )
                ],
              )
            ],
          ),
          GetBuilder<ZeitnahAdminController>(
              // init: ,
              init: ZeitnahAdminController(),
              builder: (zeitnaControler) {
                return GestureDetector(
                  onTap: () {
                    log("message");
                    zeitnaControler.editProfile.value =
                        !zeitnaControler.editProfile.value;
                  },
                  child: Obx(
                    () => Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: zeitnaControler.editProfile.value
                            ? AppColors.kcPrimaryGreen
                            : AppColors.kcPrimaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Center(
                        child: Text(
                          zeitnaControler.editProfile.value ? "Update" : "Edit",
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.kcPrimaryWhite),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class MyQrCodeSectionWidget extends StatelessWidget {
  const MyQrCodeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.26,
      width: size.width * 0.25,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kcPrimaryWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "My Qr Code",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.kcPrimaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: size.height * 0.02),
          SizedBox(height: size.height * 0.02),

          Center(
            child: SizedBox(
              width: size.width * 0.08,
              child: SvgPicture.asset(
                'assets/images/my_qr_code.svg',
                fit: BoxFit.fill,
                height: size.height * 0.13,
              ),
            ),
          ),
          // SizedBox(height: size.height * 0.01),
          const Spacer(),
          customButtom(
              size: size,
              color: AppColors.kcPrimaryColor,
              buttonSize: size.width * 0.06,
              label: "Save",
              height: size.height * 0.04)
        ],
      ),
    );
  }
}
