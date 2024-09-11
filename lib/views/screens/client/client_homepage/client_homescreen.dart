import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          () => AppConstants
              .clientPages[controller.selectedClientPageIndex.value],
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.07,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
          child: Stack(
            children: [
              // Animated Positioned widget for the indicator movement
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: controller.selectedClientPageIndex.value *
                      (size.width * 0.305),
                  width: size.width * 0.292,
                  height: size.height * 0.07,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h, bottom: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // ListView with the tab items
              ListView.builder(
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
            ],
          ),
        ));
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
      behavior: HitTestBehavior.opaque,
      child: Obx(
        () => Container(
          height: size.height * 0.07,
          margin: EdgeInsets.all(2.r),
          padding: const EdgeInsets.all(6),
          width: size.width * 0.292,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100.r),
          //     boxShadow: <BoxShadow>[
          //       BoxShadow(
          //         color: index == controller.selectedClientPageIndex.value
          //             ? Colors.grey
          //             : Colors.transparent,
          //         blurRadius: 8,
          //         blurStyle: BlurStyle.outer,
          //         offset: const Offset(0, 0),
          //         spreadRadius: 0,
          //       )
          //     ]),
          // height: size.height * 0.1,

          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  icon,
                  // scale: 1.67,
                  height: size.height * 0.04,
                  color: index == controller.selectedClientPageIndex.value
                      ? AppColors.kcPrimaryBlueColor
                      : AppColors.kcPrimaryBlackColor,
                ),
                Text(label.tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kcPrimaryBlackColor))
              ],
            ),
          ),
          // height: size.height * 0.8,
        ),
      ),
    );
  }
}
