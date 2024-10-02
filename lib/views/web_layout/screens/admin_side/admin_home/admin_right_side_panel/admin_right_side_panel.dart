import 'package:flutter/material.dart';

import '../../../app_views.dart';
import '../../admin_billing/billing_for_admin.dart';
import '../../settings/show_admin_profile.dart';
import '../admin_dashboard/admin_dashboard.dart';

class AdminRightSidePanel extends StatelessWidget {
  final PageController adminPageController;

  const AdminRightSidePanel({super.key, required this.adminPageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SizedBox(
          height: size.height,
          width: size.width * 0.75,
          child: PageView(
            allowImplicitScrolling: false,
            controller: adminPageController,
            children: [
              const AdminDashboard(),
              // const TotalAppointmentsForAdmin(),
              ServiceProvidersForAdminSide(),
              const BillingAndPaymentsForAdmin(),
              ShowAdminProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
