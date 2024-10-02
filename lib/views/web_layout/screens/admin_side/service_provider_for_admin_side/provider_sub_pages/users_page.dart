import 'package:flutter/material.dart';

import '../../../../constants/app_colors/app_colors.dart';
import '../../../../constants/app_strings.dart/app_strings.dart';
import '../../../service_provider/service_provider_home/users/my_users/my_user_widgets/my_user_table.dart';

class MyUsersPage extends StatelessWidget {
  const MyUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          // height: size.height * 0.5,
          padding: const EdgeInsets.all(8),
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: AppColors.kcPrimaryWhite,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Patients",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 18),
                ),
                const SizedBox(height: 16),
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
        ),
      ),
    );
  }
}
