import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_colors/app_colors.dart';

Widget dashboardTopBar({required Size size, required BuildContext context}) {
  return Row(
    children: [
      dashboardTopBarOption(
          count: 125,
          image: 'assets/icons/admin_provider.svg',
          label: 'Service Providers',
          size: size),
      const SizedBox(width: 16),
      dashboardTopBarOption(
          count: 80,
          image: 'assets/icons/globe.svg',
          label: 'Active Users',
          size: size),
      const SizedBox(width: 16),
      dashboardTopBarOption(
          count: 115,
          image: 'assets/icons/admin_provider.svg',
          label: 'Assigned Appointments',
          size: size),
      const SizedBox(width: 16),
      dashboardTopBarOption(
          count: 385,
          image: 'assets/icons/admin_appointment.svg',
          label: 'Total Users',
          size: size),
    ],
  );
}

Widget dashboardTopBarOption(
    {required Size size,
    required String label,
    required int count,
    required String image}) {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.kcgreyFieldColor.withOpacity(0.3),
          offset: const Offset(0, 3),
          blurRadius: 3,
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.kcSecondaryTextColor,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              count.toString(),
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.kcPrimaryTextColor,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Container(
          height: size.height * 0.05,
          width: size.width * 0.025,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.kcPrimaryColor,
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        )
      ],
    ),
  ));
}
