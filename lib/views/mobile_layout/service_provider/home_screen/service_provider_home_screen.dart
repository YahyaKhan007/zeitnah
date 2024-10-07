import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

import '../../../views.dart';

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
          title: Obx(
            () => Text(
              controller.clientAppBarText.value.tr,
              style: GoogleFonts.openSans(
                  color: AppColors.kcPrimaryBlackColor,
                  textStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ServiceProviderAccountSettingsHome());
              },
              child: SvgPicture.asset(
                'assets/icons/three_bar.svg',
                height: size.height * 0.04,
              ),
            ),
            20.w.horizontalSpace,
          ],
        ),
        body: Obx(() =>
            AppConstants.providerPages[controller.selectedPageIndex.value]),
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
                  left:
                      controller.selectedPageIndex.value * (size.width * 0.305),
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
                      if (controller.selectedPageIndex.value != 0) {
                        controller.selectedTabIndex.value = 0;
                      }

                      controller.selectedPageIndex.value = index;

                      controller.clientAppBarText.value =
                          AppConstants.bottomBarLables[index];
                    },
                    size: size,
                  );
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
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
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
          //         color: index == controller.selectedPageIndex.value
          //             ? Colors.grey
          //             : Colors.transparent,
          //         blurRadius: 8,
          //         blurStyle: BlurStyle.outer,
          //         offset: const Offset(0, 0),
          //         spreadRadius: 0,
          //       )
          //     ]),
          // height: size.height * 0.01,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  // height: size.height * 0.04,
                  color: index == controller.selectedPageIndex.value
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
        ),
      ),
    );
  }
}
