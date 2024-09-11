import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahController>();
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            topBar(size: size, pageController: pageController),
            SizedBox(
              height: size.height * 0.59,
              width: size.width,
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  controller.selectedTabIndex.value = index;
                },
                itemCount: AppConstants.appointmentPages.length,
                itemBuilder: (context, index) {
                  return AppConstants.appointmentPages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget topBar({required Size size, required PageController pageController}) {
  //   final controller = Get.find<ZeitnahController>();
  //   return Container(
  //     height: 32.h,
  //     width: size.width,
  //     margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50.r),
  //       color: Colors.grey.shade400.withOpacity(0.7),
  //     ),
  //     child: Row(
  //       children: [
  //         selectedTab(controller: controller, label: "Create", tabIndex: 0),
  //         selectedTab(controller: controller, label: "Open", tabIndex: 1),
  //         selectedTab(controller: controller, label: "Accepted", tabIndex: 2),
  //       ],
  //     ),
  //   );
  // }

  // Widget selectedTab({
  //   required int tabIndex,
  //   required ZeitnahController controller,
  //   required String label,
  // }) {
  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: () {
  //         controller.selectedTabIndex.value = tabIndex;
  //         pageController.jumpToPage(tabIndex);
  //       },
  //       child: Obx(
  //         () => AnimatedContainer(
  //           duration: const Duration(milliseconds: 400),
  //           margin: EdgeInsets.all(4.r),
  //           decoration: BoxDecoration(
  //             color: controller.selectedTabIndex.value == tabIndex
  //                 ? AppColors.kcPrimaryBackgrundColor
  //                 : Colors.transparent,
  //             borderRadius: BorderRadius.circular(50.r),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: controller.selectedTabIndex.value == tabIndex
  //                     ? Colors.grey.shade900
  //                     : Colors.transparent,
  //                 blurRadius: 6,
  //                 offset: const Offset(0, 0),
  //               ),
  //             ],
  //           ),
  //           child: Center(
  //             child: Text(
  //               label.tr,
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 color: AppColors.kcPrimaryBlackColor,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget topBar({required Size size, required PageController pageController}) {
    final controller = Get.find<ZeitnahController>();
    return Container(
      height: 32.h,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: const Color(0xffE4E4E4),
      ),
      child: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: controller.selectedTabIndex.value * (size.width / 3.5),
              width: size.width / 3.5,
              height: 32.h,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.kcPrimaryBackgrundColor,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          badges.Badge(
            // showBadge: controller.selectedTabIndex.value == 2,
            badgeStyle: const badges.BadgeStyle(
                badgeColor: AppColors.kcPrimaryBlueColor),
            badgeContent: Text(
              '+2',
              style: TextStyle(fontSize: 10.sp),
            ),
            child: Row(
              children: [
                selectedTab(
                  controller: controller,
                  label: "Create",
                  tabIndex: 0,
                  pageController: pageController,
                  size: size,
                ),
                selectedTab(
                  controller: controller,
                  label: "Open",
                  tabIndex: 1,
                  pageController: pageController,
                  size: size,
                ),
                selectedTab(
                  controller: controller,
                  label: "Accepted",
                  tabIndex: 2,
                  pageController: pageController,
                  size: size,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedTab({
    required Size size,
    required int tabIndex,
    required ZeitnahController controller,
    required String label,
    required PageController pageController,
  }) {
    return GestureDetector(
      onTap: () {
        controller.selectedTabIndex.value = tabIndex;
        pageController.jumpToPage(tabIndex);
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 32.h,
        width: size.width / 3.5,
        child: Center(
          child: Text(
            label.tr,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.kcPrimaryBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
