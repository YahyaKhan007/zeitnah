import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';
import 'package:zeitnah/views/screens/service_provider/provider_account_settings.dart/account_setting_home_service_provider.dart';

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
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(()=> const ServiceProviderAccountSettingsHome());
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
        height: size.height * 0.08,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
              spreadRadius: -4,
            )
          ],
          borderRadius: BorderRadius.circular(100.r),
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
          padding: EdgeInsets.all(6),
          width: size.width * 0.292,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
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
          // height: size.height * 0.01,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, height: size.height * 0.05, color: index == controller.selectedPageIndex.value
                        ? AppColors.kcPrimaryBlueColor : AppColors.kcPrimaryBlackColor,),
                Text(
                  label.tr,
                  style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColors.kcPrimaryBlackColor)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
