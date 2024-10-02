import 'package:flutter/cupertino.dart';

import '../../../../constants/app_colors/app_colors.dart';

Widget buildLabels() {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: Text(
            "AUTHOR",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 2,
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
              "Patients",
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
              "Registered",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      const SizedBox(width: 48),
    ],
  );
}

Widget buildTabelData(
    {required String photo,
    required String providerName,
    required String providerEmail,
    required String phoneNumber,
    required String totalPatients,
    required String registeredDate,
    required VoidCallback onEdit}) {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    providerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.kcPrimaryTextColor,
                    ),
                  ),
                  Text(
                    providerEmail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.kcPrimaryTextColor,
                    ),
                  )
                ],
              )
            ],
          )),
      Expanded(
          flex: 2,
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
              totalPatients,
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
      CupertinoButton(
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          ),
          onPressed: () {})
    ],
  );
}
