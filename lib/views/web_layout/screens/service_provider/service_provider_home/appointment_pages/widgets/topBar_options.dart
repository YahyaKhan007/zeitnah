import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../../constants/app_colors/app_colors.dart';

class AppointmentSubPageOptionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final String icon;
  final String label;

  AppointmentSubPageOptionWidget(
      {super.key,
      required this.onTap,
      required this.index,
      required this.icon,
      required this.label});

  final zeitnahAdminController = Get.find<ZeitnahAdminController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          height: 40,
          width: size.width * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: zeitnahAdminController.appointmentSubScreenIndex.value ==
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
                                .appointmentSubScreenIndex.value !=
                            index
                        ? AppColors.kcPrimaryColor
                        : AppColors.kcPrimaryWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      height: size.height * 0.02,
                      color: zeitnahAdminController
                                  .appointmentSubScreenIndex.value ==
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
                                  .appointmentSubScreenIndex.value ==
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

Widget serviceProviderOptions({required BuildContext context}) {
  final zeitnahAdminController = Get.find<ZeitnahAdminController>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppointmentSubPageOptionWidget(
          index: 0,
          icon: 'assets/icons/admin_dashboard.svg',
          label: 'Create',
          onTap: () {
            zeitnahAdminController.appointmentSubScreenIndex.value = 0;
          }),
      AppointmentSubPageOptionWidget(
          index: 1,
          label: 'Open',
          icon: 'assets/icons/admin_appointment.svg',
          onTap: () {
            zeitnahAdminController.appointmentSubScreenIndex.value = 1;
          }),
      AppointmentSubPageOptionWidget(
          index: 2,
          label: 'Accepted',
          icon: 'assets/icons/admin_appointment.svg',
          onTap: () {
            zeitnahAdminController.appointmentSubScreenIndex.value = 2;
          })
    ],
  );
}
