import 'package:flutter/material.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings.dart/app_strings.dart';
import 'admin_billing_widgets/billing_widgets.dart';

class BillingAndPaymentsForAdmin extends StatelessWidget {
  const BillingAndPaymentsForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final adminController = Get.find<ZeitnahAdminController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: size.height * 0.8,
          width: size.width * 0.77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(016),
            color: AppColors.kcPrimaryWhite,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
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
                  "Billing and Payments",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 18),
                ),
                const SizedBox(height: 16),
                buildBillingLabels(),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: AppStrings.providerPhotos.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      );
                    },
                    itemBuilder: (context, index) {
                      return buildBillingTabelData(
                          onEdit: () {},
                          amount: AppStrings.providerPhone[index],
                          registerTime: AppStrings.registeredTime[index],
                          providerEmail: AppStrings.providerEmails[index],
                          providerName: AppStrings.providerNames[index],
                          registeredDate: AppStrings.registereddates[index],
                          patientName: "Esthera Jackson");
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
