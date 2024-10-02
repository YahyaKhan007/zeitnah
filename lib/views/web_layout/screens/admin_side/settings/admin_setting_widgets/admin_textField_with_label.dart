import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

class AdminTextfieldWithLabelWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool editable;
  final bool? isPassword;
  final String hintText;

  const AdminTextfieldWithLabelWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.editable,
    this.isPassword,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final zeitnahControler = Get.find<ZeitnahAdminController>();
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.3,
        maxHeight: 80, // Adjust this value as needed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: zeitnahControler.editProfile.value
                      ? AppColors.kcgreyFieldColor.withOpacity(0.1)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextFormField(
                    enabled: zeitnahControler.editProfile.value,
                    style: TextStyle(
                        color: AppColors.kcgreyFieldColor,
                        fontSize: 14,
                        fontWeight: zeitnahControler.editProfile.value
                            ? FontWeight.normal
                            : FontWeight.bold),
                    controller: controller,
                    obscureText: isPassword ?? false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: isPassword == null ? hintText : '********',
                      hintStyle: TextStyle(
                          color: zeitnahControler.editProfile.value
                              ? AppColors.kcgreyFieldColor.withOpacity(0.5)
                              : AppColors.kcPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: zeitnahControler.editProfile.value
                              ? FontWeight.normal
                              : FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
