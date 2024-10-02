import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/login/controller/web_login_controller.dart';
import 'package:zeitnah/views/web_layout/screens/service_provider/auth_screens/registration/controller/web_register_controller.dart';

import '../../constants/app_colors/app_colors.dart';

Widget labelTextFieldColumnForRegister(
    {required String label,
    required TextEditingController controller,
    required WebRegisterController registerController,
    IconData? trailingIcon,
    VoidCallback? onTap,
    String? hintText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.kcPrimaryTextColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kcgreyFieldColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                trailingIcon == null
                    ? Expanded(
                        child: TextFormField(
                          controller: controller,
                          obscureText: trailingIcon != null &&
                              registerController.showPassword.value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.kcgreyFieldColor,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.kcgreyFieldColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    : Obx(
                        () => Expanded(
                          child: TextFormField(
                            controller: controller,
                            obscureText: trailingIcon != null &&
                                registerController.showPassword.value,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.kcgreyFieldColor,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hintText,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColors.kcgreyFieldColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  child: trailingIcon == null
                      ? null
                      : Icon(
                          trailingIcon,
                          color: AppColors.kcPrimaryTextColor,
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget labelTextFieldColumnForLogin(
    {required String label,
    required TextEditingController controller,
    required WebLoginController loginController,
    IconData? trailingIcon,
    VoidCallback? onTap,
    String? hintText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.kcPrimaryTextColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kcgreyFieldColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                trailingIcon == null
                    ? Expanded(
                        child: TextFormField(
                          controller: controller,
                          obscureText: trailingIcon != null &&
                              loginController.showPassword.value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.kcgreyFieldColor,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.kcgreyFieldColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    : Obx(
                        () => Expanded(
                          child: TextFormField(
                            controller: controller,
                            obscureText: trailingIcon != null &&
                                loginController.showPassword.value,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.kcgreyFieldColor,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hintText,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColors.kcgreyFieldColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  child: trailingIcon == null
                      ? null
                      : InkWell(
                          onTap: () {
                            loginController.showPassword.value =
                                !loginController.showPassword.value;
                          },
                          child: Icon(
                            trailingIcon,
                            color: AppColors.kcPrimaryTextColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
