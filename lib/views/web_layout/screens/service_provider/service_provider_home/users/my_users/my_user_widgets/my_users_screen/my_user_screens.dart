import 'package:flutter/material.dart';

import '../../../../../../../constants/app_colors/app_colors.dart';
import '../../../../../../../constants/app_strings.dart/app_strings.dart';
import '../my_user_table.dart';

class MyUsers extends StatelessWidget {
  const MyUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.5,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryWhite,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  blurRadius: 3)
            ]),
        child: Column(
          children: [
            buildLabelsForMyUsers(),
            Expanded(
              child: ListView.separated(
                itemCount: AppStrings.providerPhotos.length,
                // physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  );
                },
                itemBuilder: (context, index) {
                  return buildTabelDataForMyUsers(
                      onEdit: () {},
                      index: index,
                      phoneNumber: AppStrings.providerPhone[index],
                      providerEmail: AppStrings.providerEmails[index],
                      providerName: AppStrings.providerNames[index],
                      registeredDate: AppStrings.registereddates[index],
                      totalPatients:
                          AppStrings.totalPatients[index].toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
