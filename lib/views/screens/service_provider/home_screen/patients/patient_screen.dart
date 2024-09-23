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
  TextEditingController searchController = TextEditingController();
  PageController pageController = PageController();
  final zeitnahControler = Get.find<ZeitnahController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topBar(pageController: pageController, size: size),
          16.h.verticalSpace,
          Obx(
            () => Expanded(
              child: zeitnahControler.selectedClientPatientPageIndex.value == 0
                  ? PatientConnected()
                  : const PatientRequests(),
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar({required Size size, required PageController pageController}) {
    final controller = Get.find<ZeitnahController>();
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
          offset: const Offset(0, -3),
          blurRadius: 10,
        ),
      ]),
      child: Column(
        children: [
          20.h.verticalSpace,
          Container(
            height: 32.h,
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: const Color(0xffE4E4E4),
            ),
            child: Stack(
              children: [
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: controller.selectedClientPatientPageIndex.value *
                        (size.width / 2.3),
                    width: size.width / 2.35,
                    height: 32.h,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
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
                Row(
                  children: [
                    selectedTab(
                      size: size,
                      controller: controller,
                      label: "Connected",
                      pageController: pageController,
                      tabIndex: 0,
                    ),
                    selectedTab(
                      size: size,
                      controller: controller,
                      pageController: pageController,
                      label: "Requests",
                      tabIndex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.h.verticalSpace,
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     final containerWidth =
          //         constraints.maxWidth - 64.w; // Subtracting horizontal margin
          //     final containerHeight =
          //         36.h; // Increased height for better touch target
          //     final iconSize = containerHeight * 0.47;
          //     final fontSize = containerHeight * 0.28;
          //
          //     return Container(
          //       margin: EdgeInsets.symmetric(horizontal: 16.w),
          //       width: containerWidth,
          //       height: containerHeight,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12.r),
          //         color: AppColors.kcGreyColor.withOpacity(0.5),
          //       ),
          //       child: Center(
          //         child: TextFormField(
          //           style: TextStyle(
          //             color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
          //             fontWeight: FontWeight.normal,
          //             fontSize: fontSize,
          //           ),
          //           textAlignVertical: TextAlignVertical.center,
          //           decoration: InputDecoration(
          //             border: InputBorder.none,
          //             contentPadding:
          //                 EdgeInsets.symmetric(vertical: containerHeight * 0.2),
          //             prefixIcon: Padding(
          //               padding: EdgeInsets.only(left: containerWidth * 0.05),
          //               child: Icon(
          //                 Icons.search,
          //                 size: iconSize,
          //                 color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
          //               ),
          //             ),
          //             hintText: "Search",
          //             hintStyle: TextStyle(
          //               color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
          //               fontWeight: FontWeight.normal,
          //               fontSize: fontSize,
          //             ),
          //             alignLabelWithHint: true, // Ensures hint is aligned
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.kcGreyColor.withOpacity(0.5),
            ),
            height: 48.h,
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                // SvgPicture.asset(
                //   image,
                //   height: size.height * 0.03,
                // ),
                const Icon(Icons.search),
                16.w.horizontalSpace,
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0xff64748B),
                    ),
                    controller: searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search".tr,
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff64748B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          12.h.verticalSpace,
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
        controller.selectedClientPatientPageIndex.value = tabIndex;

        // Use this to ensure jumpToPage is called after the first frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pageController.hasClients) {
            pageController.jumpToPage(tabIndex);
          }
        });
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 32.h,
        width: size.width / 2.35,
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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class ResponsiveSearchWidget extends StatelessWidget {
  const ResponsiveSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        // Calculate responsive sizes
        final containerHeight = height * 0.07; // Adjust as needed
        final horizontalMargin = width * 0.08; // Equivalent to 32.w
        final borderRadius = width * 0.03; // Equivalent to 12.r
        final iconSize = width * 0.055; // Equivalent to 22.r
        final fontSize = width * 0.03; // Equivalent to 12.sp

        return Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          height: containerHeight,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.kcGreyColor.withOpacity(0.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: containerHeight,
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                    fontWeight: FontWeight.normal,
                    fontSize: fontSize,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Icon(
                        Icons.search,
                        size: iconSize,
                        color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: AppColors.kcPrimaryBlackColor.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
