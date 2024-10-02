import 'package:flutter/material.dart';

import '../../appointment_pages/appointment_free_slot.dart';
import '../../settings_for_provider/profile_for_service_provider.dart';
import '../../statistics_for_provider/statistics_for_provider.dart';
import '../../users/my_users_home.dart';

class ProviderRightSidePanel extends StatelessWidget {
  final PageController adminPageController;

  const ProviderRightSidePanel({super.key, required this.adminPageController});

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
            physics: const NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            controller: adminPageController,
            children: [
              const AppointmentFreeSlot(),
              ServiceProviderMyUsersHome(),
              const StatisticsForProvider(),
              const ProfileForProvider()
              // ShowAdminProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
