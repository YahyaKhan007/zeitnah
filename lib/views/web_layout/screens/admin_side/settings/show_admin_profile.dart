import 'package:flutter/material.dart';

import '../../../constants/app_colors/app_colors.dart';
import 'admin_setting_widgets/admin_textField_with_label.dart';
import 'admin_setting_widgets/edit_profile_widgets.dart';

class ShowAdminProfile extends StatelessWidget {
  ShowAdminProfile({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final adminController = Get.find<ZeitnahAdminController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: size.height * 0.8,
          width: size.width * 0.77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(016),
            color: AppColors.kcPrimaryWhite,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 18),
                ),
                const SizedBox(height: 16),
                const EditProfileWidget(),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    AdminTextfieldWithLabelWidget(
                      controller: nameController,
                      editable: false,
                      hintText: 'Azeem Khalid',
                      label: 'Name',
                      isPassword: null,
                    ),
                    AdminTextfieldWithLabelWidget(
                      controller: addressController,
                      editable: false,
                      hintText: '',
                      label: 'Address',
                      isPassword: null,
                    ),
                    AdminTextfieldWithLabelWidget(
                      controller: emailController,
                      editable: false,
                      hintText: 'random.person@gmail.com',
                      label: 'Email',
                      isPassword: null,
                    ),
                    AdminTextfieldWithLabelWidget(
                      controller: passwordController,
                      editable: false,
                      hintText: '11223344',
                      label: 'Password',
                      isPassword: true,
                    ),
                    AdminTextfieldWithLabelWidget(
                      controller: phoneNumberController,
                      editable: false,
                      hintText: '+923121234567',
                      label: 'Phone Number',
                      isPassword: null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
