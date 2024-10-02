import 'package:flutter/cupertino.dart';

import '../../../../../../constants/app_colors/app_colors.dart';

Widget buildAppointmentLabels() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 3,
          child: Text(
            "Users",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Service Provider",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Time",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Date",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      const SizedBox(width: 24),
    ],
  );
}

Widget buildAppointmentTabelData(
    {required String registerTime,
    required String providerName,
    required String providerEmail,
    required String phoneNumber,
    required String patientName,
    required String registeredDate,
    required VoidCallback onEdit}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                patientName,
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.kcPrimaryTextColor,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                providerEmail,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kcPrimaryTextColor,
                ),
              )
            ],
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              phoneNumber,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              providerName,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              registerTime,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              registeredDate,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      const SizedBox(width: 24),
    ],
  );
}
