import 'package:flutter/material.dart';

import '../../../../constants/app_colors/app_colors.dart';
import '../../../../constants/app_strings.dart/app_strings.dart';
import '../widgets/build_table_data.dart';

class ServiceProviderPage extends StatelessWidget {
  const ServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          // height: size.height * 0.8,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(016),
            color: AppColors.kcPrimaryWhite,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Service Providers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 18),
                ),
                const SizedBox(height: 16),
                buildLabels(),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: AppStrings.providerPhotos.length,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      );
                    },
                    itemBuilder: (context, index) {
                      return buildTabelData(
                          onEdit: () {},
                          phoneNumber: AppStrings.providerPhone[index],
                          photo: AppStrings.providerPhotos[index],
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
