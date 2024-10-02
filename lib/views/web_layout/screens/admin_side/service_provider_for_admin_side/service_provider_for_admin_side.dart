import 'package:flutter/material.dart'; // import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../constants/app_colors/app_colors.dart';
import 'provider_sub_pages/service_providers.dart';
import 'provider_sub_pages/total_appointments_for_admin/total_appointments_for_admin.dart';
import 'provider_sub_pages/users_page.dart';

class ServiceProvidersForAdminSide extends StatelessWidget {
  ServiceProvidersForAdminSide({super.key});

  final zeitnahAdminController = Get.find<ZeitnahAdminController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            height: 48,
            width: size.width * 0.4,
            child: serviceProviderOptions(context: context)),
        const SizedBox(
          height: 8,
        ),
        Obx(() => zeitnahAdminController.adminProviderSubScreenIndex.value == 0
            ? const Expanded(child: ServiceProviderPage())
            : zeitnahAdminController.adminProviderSubScreenIndex.value == 1
                ? const Expanded(child: TotalAppointmentsForAdmin())
                : const Expanded(child: MyUsersPage())),
      ],
    );
  }

  Widget serviceProviderOptions({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        serviceProviderOptionWidget(
            index: 0,
            context: context,
            icon: 'assets/icons/admin_appointment.svg',
            label: 'Service Provider',
            onTap: () {
              zeitnahAdminController.adminProviderSubScreenIndex.value = 0;
            }),
        serviceProviderOptionWidget(
            index: 1,
            context: context,
            label: 'Appointments',
            icon: 'assets/icons/admin_provider.svg',
            onTap: () {
              zeitnahAdminController.adminProviderSubScreenIndex.value = 1;
            }),
        serviceProviderOptionWidget(
            index: 2,
            context: context,
            label: 'Patients',
            icon: 'assets/icons/admin_appointment.svg',
            onTap: () {
              zeitnahAdminController.adminProviderSubScreenIndex.value = 2;
            })
      ],
    );
  }

  Widget serviceProviderOptionWidget(
      {required String icon,
      required index,
      required BuildContext context,
      required String label,
      required VoidCallback onTap}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          height: 40,
          width: size.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: zeitnahAdminController.adminProviderSubScreenIndex.value ==
                      index
                  ? AppColors.kcPrimaryColor
                  : AppColors.kcPrimaryWhite,
              boxShadow: const [
                BoxShadow(
                    color: AppColors.kcgreyFieldColor,
                    blurRadius: 4,
                    offset: Offset(0, 0))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: zeitnahAdminController
                                .adminProviderSubScreenIndex.value !=
                            index
                        ? AppColors.kcPrimaryColor
                        : AppColors.kcPrimaryWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      height: size.height * 0.025,
                      color: zeitnahAdminController
                                  .adminProviderSubScreenIndex.value ==
                              index
                          ? AppColors.kcPrimaryColor
                          : AppColors.kcPrimaryWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 10,
                      color: zeitnahAdminController
                                  .adminProviderSubScreenIndex.value ==
                              index
                          ? AppColors.kcPrimaryWhite
                          : AppColors.kcPrimaryBlackColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
