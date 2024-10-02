import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_admin_controller.dart';

import '../../../../../../constants/app_colors/app_colors.dart';

class UserPageOptionWidget extends StatelessWidget {
  final PageController userPageController;

  const UserPageOptionWidget({super.key, required this.userPageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahAdminController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customOptionContainerForUser(
          controller: controller,
          image: 'assets/icons/my_user.svg',
          label: "My Users",
          size: size,
          index: 0,
          show: false,
          onTap: () {
            userPageController.animateToPage(0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
            controller.providerUserTab.value = 0;
          },
        ),
        const SizedBox(width: 16),
        customOptionContainerForUser(
            controller: controller,
            label: "User Requests",
            size: size,
            show: true,
            image: 'assets/icons/add_user.svg',
            onTap: () {
              userPageController.animateToPage(1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
              controller.providerUserTab.value = 1;
            },
            index: 1)
      ],
    );
  }

  Widget customOptionContainerForUser(
      {required ZeitnahAdminController controller,
      required Size size,
      required String label,
      required bool show,
      required String image,
      required VoidCallback onTap,
      required int index}) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          // height: size.height * 0.05,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: controller.providerUserTab.value == index
                ? AppColors.kcPrimaryColor
                : AppColors.kcPrimaryWhite,
            boxShadow: [
              BoxShadow(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  blurRadius: 3),
            ],
          ),
          child: Center(
            child: ListTile(
              // contentPadding: EdgeInsets.only(left: 8.w, right: 2.w),

              leading: Container(
                // height: size.height * 0.03,
                // width: size.width * 0.015,
                padding: const EdgeInsets.symmetric(vertical: 8),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: controller.providerUserTab.value == index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    color: controller.providerUserTab.value == index
                        ? AppColors.kcPrimaryColor
                        : AppColors.kcPrimaryWhite,
                    // height: size.height * 0.015,
                    height: 18,
                  ),
                ),
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'helvetica',
                      color: controller.providerUserTab.value == index
                          ? AppColors.kcPrimaryWhite
                          : AppColors.kcPrimaryTextColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
              trailing: Visibility(
                visible: show,
                child: CircleAvatar(
                  // radius: size.height * 0.015,
                  radius: 18,
                  backgroundColor: controller.providerUserTab.value == index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryColor,
                  child: Text(
                    "+2",
                    style: TextStyle(
                        fontFamily: 'helvetica',
                        color: controller.providerUserTab.value == index
                            ? AppColors.kcPrimaryTextColor
                            : AppColors.kcPrimaryWhite,
                        fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
