import 'package:flutter/material.dart';

import 'widget_of_settings_for_provider/profile_sections.dart';

class ProfileForProvider extends StatelessWidget {
  const ProfileForProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSectionWidget(),
          SizedBox(height: size.height * 0.02),
          const MyQrCodeSectionWidget()
        ],
      ),
    );
  }
}
