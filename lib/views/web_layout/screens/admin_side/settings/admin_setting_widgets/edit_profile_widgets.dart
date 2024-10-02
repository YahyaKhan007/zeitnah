import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final zeitnahControler = Get.find<ZeitnahAdminController>();

    return ListTile(
      title: Text(
        "Admin Panel",
        style: TextStyle(
            fontSize: 14,
            color: AppColors.kcPrimaryBlackColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "alexarawles@gmail.com",
        style: TextStyle(fontSize: 14, color: AppColors.kcPrimaryTextColor),
      ),
      trailing: GestureDetector(
        onTap: () {
          zeitnahControler.editProfile.value =
              !zeitnahControler.editProfile.value;
        },
        child: Obx(
          () => Container(
            height: 32,
            width: 64,
            decoration: BoxDecoration(
              color: zeitnahControler.editProfile.value
                  ? AppColors.kcPrimaryGreen
                  : AppColors.kcPrimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                zeitnahControler.editProfile.value ? "Update" : "Edit",
                style: const TextStyle(
                    fontSize: 14, color: AppColors.kcPrimaryWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
