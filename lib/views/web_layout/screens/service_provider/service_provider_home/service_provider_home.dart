import 'package:flutter/material.dart';

import '../../../constants/app_colors/app_colors.dart';
import 'provider_home_widgets/provider_left_panel/provider_left_panel.dart';
import 'provider_home_widgets/provider_right_side_panel/provider_right_side_panel.dart';
import 'provider_home_widgets/provider_topbar.dart';

class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({super.key});

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  PageController adminPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kcPrimaryBackground,
      bottomNavigationBar: SizedBox(
        height: 20,
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '@ 2021 Made with',
                    style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10,
                    )),
                const TextSpan(
                    text: ' ❤ ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    )),
                TextSpan(
                    text: 'by ',
                    style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10,
                    )),
                const TextSpan(
                  text: ' Stackwise Tecnogies ',
                  style: TextStyle(
                    color: AppColors.kcPrimaryColor,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                    text: 'for a better web',
                    style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10,
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 16.h.verticalSpace,
          const ProviderHomeTopbarWidget(),
          Expanded(
            child: Row(
              children: [
                ProviderLeftSidePanel(
                  adminPageController: adminPageController,
                ),
                const SizedBox(width: 24),
                ProviderRightSidePanel(
                  adminPageController: adminPageController,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
