import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';
import 'package:zeitnah/views/screens/service_provider/provider_account_settings.dart/account_setting_provider_views.dart';

class ServiceProviderHomeScreen extends StatelessWidget {
  ServiceProviderHomeScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahController>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        centerTitle: true,
        title: Text(
          "Set Appointment".tr,
          style: GoogleFonts.openSans(
              color: AppColors.kcPrimaryBlackColor,
              textStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const ServiceProviderAccountSettingsHome());
            },
            child: Image.asset(
              'assets/icons/menu.png',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Obx(
          () => AppConstants.providerPages[controller.selectedPageIndex.value]),

      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.bottomBarLables.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return selectedTab(
                index: index,
                controller: controller,
                color: Colors.white,
                icon: AppConstants.bottomBarImages[index],
                label: AppConstants.bottomBarLables[index],
                onTap: () {
                  controller.selectedPageIndex.value = index;
                  log("Page index is ${controller.selectedPageIndex.value + 1}");
                },
                size: size);
          },
        ),
      ),
    );
  }

  Widget selectedTab(
      {required Size size,
      required Color color,
      required ZeitnahController controller,
      required String icon,
      required String label,
      required int index,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(2.r),
          width: size.width * 0.292,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: index == controller.selectedPageIndex.value
                      ? Colors.grey
                      : Colors.transparent,
                  blurRadius: 8,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                )
              ]),
          height: size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: size.height * 0.05,
              ),
              Text(
                label.tr,
                style: GoogleFonts.murecho(
                    color: AppColors.kcPrimaryBlackColor,
                    textStyle: TextStyle(
                        fontSize: 10.dg, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
