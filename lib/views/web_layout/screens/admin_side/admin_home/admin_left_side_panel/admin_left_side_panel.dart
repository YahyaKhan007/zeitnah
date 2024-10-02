import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

class AdminLeftSidePanel extends StatelessWidget {
  final PageController adminPageController;

  const AdminLeftSidePanel({super.key, required this.adminPageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();

    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDashboardOption(
              image: 'assets/icons/admin_dashboard.svg',
              index: 0,
              label: 'Dashboard',
              onTap: () => _changePage(adminController, 0, "Dashboard"),
            ),
            // _buildDashboardOption(
            //   image: 'assets/icons/admin_appointment.svg',
            //   index: 1,
            //   label: 'Appointments',
            //   onTap: () => _changePage(adminController, 1, "Appointments"),
            // ),
            _buildDashboardOption(
              image: 'assets/icons/admin_provider.svg',
              index: 1,
              label: 'Service Provider',
              onTap: () => _changePage(adminController, 1, "Service Provider"),
            ),
            _buildDashboardOption(
              image: 'assets/icons/admin_appointment.svg',
              index: 2,
              label: 'Billing',
              onTap: () =>
                  _changePage(adminController, 2, "Billing and Payments"),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 16),
              child: Text(
                "ACCOUNT SETTINGS",
                style: TextStyle(
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 12,
                    fontFamily: 'helvetica',
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 8),
            _buildDashboardOption(
              image: 'assets/icons/settings.svg',
              index: 3,
              label: 'Settings',
              onTap: () => _changePage(adminController, 3, "Settings"),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(
      ZeitnahAdminController controller, int index, String pageName) {
    controller.dashboardScreentIndex.value = index;
    controller.selectedPage.value = pageName;
    adminPageController.jumpToPage(index);
  }

  Widget _buildDashboardOption({
    required String image,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final adminController = Get.find<ZeitnahAdminController>();
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: adminController.dashboardScreentIndex.value != index
                ? <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ]
                : null,
            color: adminController.dashboardScreentIndex.value == index
                ? AppColors.kcPrimaryColor
                : AppColors.kcPrimaryWhite,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 32,
                  width: 32,
                  color: adminController.dashboardScreentIndex.value == index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryColor,
                  child: Center(
                    child: SvgPicture.asset(
                      image,
                      color:
                          adminController.dashboardScreentIndex.value != index
                              ? AppColors.kcPrimaryWhite
                              : AppColors.kcPrimaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                    color: adminController.dashboardScreentIndex.value == index
                        ? AppColors.kcPrimaryWhite
                        : AppColors.kcPrimaryTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
