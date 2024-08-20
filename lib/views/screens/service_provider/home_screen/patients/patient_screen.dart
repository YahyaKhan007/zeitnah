import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../services/services.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import 'patient_views.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topBar(pageController: pageController, size: size),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                PatientConnected(), // Connected tab content
                PatientRequests(), // Requests tab content
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar({required Size size, required PageController pageController}) {
    final controller = Get.find<ZeitnahController>();
    return Container(
      height: 40.h,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: const Color(0xffE4E4E4),
      ),
      child: Row(
        children: [
          selectedTab(
            controller: controller,
            label: "Connected",
            tabIndex: 0,
          ),
          selectedTab(
            controller: controller,
            label: "Requests",
            tabIndex: 1,
          ),
        ],
      ),
    );
  }

  Widget selectedTab({
    required int tabIndex,
    required ZeitnahController controller,
    required String label,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.selectPateientTab.value = tabIndex;
          pageController.jumpToPage(tabIndex);
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: controller.selectPateientTab.value == tabIndex
                  ? AppColors.kcPrimaryBackgrundColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.r),
              boxShadow: [
                BoxShadow(
                  color: controller.selectPateientTab.value == tabIndex
                      ? Colors.grey
                      : Colors.transparent,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
