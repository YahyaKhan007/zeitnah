import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/services.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_constants.dart';

class ClientsHomeScreen extends StatelessWidget {
  const ClientsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ZeitnahController>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () =>
            AppConstants.clientPages[controller.selectedClientPageIndex.value],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.088,
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
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.clientBottomBarLables.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return selectedTab(
                index: index,
                controller: controller,
                color: Colors.white,
                icon: AppConstants.clientBottomBarImages[index],
                label: AppConstants.clientBottomBarLables[index],
                onTap: () {
                  controller.selectedClientPageIndex.value = index;
                  log("Page index is ${controller.selectedClientPageIndex.value + 1}");
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
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: index == controller.selectedClientPageIndex.value
                      ? Colors.grey
                      : Colors.transparent,
                  blurRadius: 8,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                )
              ]),
          height: size.height * 0.06,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                scale: 1.5,
                color: AppColors.kcPrimaryBlackColor,
              ),
              FittedBox(
                child: Text(
                  label.tr,
                  style: GoogleFonts.murecho(
                      color: AppColors.kcPrimaryBlackColor,
                      textStyle: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          // height: size.height * 0.8,
         


        ),
      ),
    );
  }
}
