import 'package:flutter/material.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../app_views.dart';
import 'admin_right_side_panel/admin_right_side_panel.dart';
import 'widgets/admin_top_bar.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  PageController adminPageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kcPrimaryBAckGroundColor,
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
          const SizedBox(height: 16),
          topBar(size: size, context: context),
          Expanded(
            child: Row(
              children: [
                AdminLeftSidePanel(
                  adminPageController: adminPageController,
                ),
                const SizedBox(width: 24),
                AdminRightSidePanel(
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
