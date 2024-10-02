import 'package:flutter/cupertino.dart';

import '../../../../constants/app_colors/app_colors.dart';

Widget buildBillingLabels() {
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
              "Amount",
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
      const SizedBox(width: 48),
    ],
  );
}

Widget buildBillingTabelData(
    {required String registerTime,
    required String providerName,
    required String providerEmail,
    required String amount,
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
          )),
      Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                height: 24,
                width: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.kcPrimaryGreen),
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    // "\$$amount",
                    "\$512",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.kcPrimaryWhite,
                    ),
                  ),
                ),
              ),
            ],
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
