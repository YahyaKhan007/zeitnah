import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_colors/app_colors.dart';

Widget buildLabelsForMyUsers() {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: Text(
            "Users",
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
              "Status",
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

Widget buildTabelDataForMyUsers({
  required String providerName,
  required String providerEmail,
  required String phoneNumber,
  required String totalPatients,
  required String registeredDate,
  required VoidCallback onEdit,
  required int index,
}) {
  return Row(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
          flex: 5,
          child: Row(
            children: [
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
          child: SvgPicture.asset("assets/icons/diomond.svg",
              color: [1, 3, 5].contains(index) == true
                  ? const Color(0xffC4B420)
                  : AppColors.kcPrimaryTextColor),
        ),
      ),
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
