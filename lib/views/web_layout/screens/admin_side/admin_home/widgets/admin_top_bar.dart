import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../services/controller_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

Widget topBar({required Size size, required BuildContext context}) {
  final zeitnahControler = Get.find<ZeitnahAdminController>();

  return SizedBox(
    height: size.height * 0.1,
    child: Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Admin Panel",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: AppColors.kcPrimaryTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Obx(
          () => SizedBox(
            width: size.width * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "pages ",
                                  style: TextStyle(
                                      color: AppColors.kcgreyFieldColor
                                          .withOpacity(0.5)),
                                ),
                                Text(
                                  "/ ${zeitnahControler.selectedPage.value}",
                                  style: const TextStyle(
                                    color: AppColors.kcPrimaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Dashboard",
                              style: TextStyle(
                                color: AppColors.kcPrimaryTextColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !zeitnahControler.selectedPage.value
                            .startsWith('Dash'),
                        child: Center(
                          child: Container(
                            height: size.height * 0.06,
                            // Set height relative to screen size
                            width: size.width * 0.15,
                            // Set width relative to screen size
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColors.kcPrimaryWhite,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              // Optional padding for better spacing
                              child: FittedBox(
                                // FittedBox for dynamic scaling
                                fit: BoxFit.scaleDown,
                                // Scales the content dynamically
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 16,
                                      color: AppColors.kcgreyFieldColor
                                          .withOpacity(0.6),
                                    ),
                                    const SizedBox(width: 8),
                                    // Small spacing between icon and input field
                                    SizedBox(
                                      width: size.width * 0.1,
                                      // Dynamic width based on screen size
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        // Centers the text
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 12),
                                          // Vertical centering
                                          hintText: "Type here ...",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.kcgreyFieldColor
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            fontSize:
                                                14), // Set text size to scale dynamically
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
