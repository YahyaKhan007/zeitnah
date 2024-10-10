import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/patients/patient_controller.dart';

import '../../../../../services/services.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../views.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final PatientScreenController controller =
      Get.find<PatientScreenController>();
  final zeitnahController = Get.find<ZeitnahController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          topBar(pageController: controller.pageController, size: size),
          16.h.verticalSpace,
          // Obx(
          //   () => controller.searchText.value.isEmpty
          //       ? const Text(
          //           "Search is Empty",
          //           style: TextStyle(color: Colors.black, fontSize: 30),
          //         )
          //       : const Text(
          //           "Not Empty",
          //           style: TextStyle(color: Colors.black, fontSize: 30),
          //         ),
          // ),
          Expanded(
            child: Obx(
              () => controller.searchText.value.isNotEmpty
                  ? controller.selectedClientPatientPageIndex.value == 0
                      ? controller.searchConnectedUsers.isEmpty
                          ? Center(
                              child: Text(
                                'No Connected Patients',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.kcPrimaryBlackColor),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8).w,
                              child: CupertinoScrollbar(
                                thickness: 4.w,
                                radius: Radius.circular(40.r),
                                thumbVisibility: true,
                                child: ListView.builder(
                                  itemCount:
                                      controller.searchConnectedUsers.length,
                                  itemBuilder: (context, index) {
                                    final user =
                                        controller.searchConnectedUsers[index];
                                    return patientName(
                                      drName:
                                          "${user.firstName} ${user.lastName}",
                                      index: index,
                                      onTap: () {
                                        Get.to(
                                          () => ViewPatientDetails(
                                            user: user,
                                            isConnected: true,
                                            connectedController: controller,
                                          ),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                      : Container(
                          child: controller.searchRequestUsers.isEmpty
                              ? Center(
                                  child: Text(
                                    'No Requests Found',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.kcPrimaryBlackColor),
                                  ),
                                )
                              : CupertinoScrollbar(
                                  thickness: 4.w,
                                  radius: Radius.circular(40.r),
                                  thumbVisibility: true,
                                  child: ListView.builder(
                                    itemCount:
                                        controller.searchRequestUsers.length,
                                    itemBuilder: (context, index) {
                                      final user =
                                          controller.searchRequestUsers[index];
                                      return AcceptDeclineRequest(
                                        requestedUser: user,
                                        controller: controller,
                                      );
                                    },
                                  ),
                                ),
                        )
                  : controller.selectedClientPatientPageIndex.value == 0
                      ? const PatientConnected()
                      : const PatientRequests(),
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar({required Size size, required PageController pageController}) {
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
                      // controller: zeitnahController,
                      label: "Connected",
                      pageController: pageController,
                      tabIndex: 0,
                    ),
                    selectedTab(
                      size: size,
                      // controller: zeitnahController,
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
                InkWell(
                    onTap: () {
                      // controller
                      //     .searchQuery(controller.searchController.value.text);
                    },
                    child: const Icon(Icons.search)),
                16.w.horizontalSpace,
                Expanded(
                  child: TextFormField(
                    onChanged: controller.updateSearchText,

                    //     (val) {
                    //   if (val.isEmpty) {
                    //     controller.searchRequestUsers.clear();
                    //     controller.searchConnectedUsers.clear();
                    //   } else {
                    //     controller.searchQuery(val);
                    //   }
                    // },
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0xff64748B),
                    ),
                    controller: controller.searchController.value,
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
    // required ZeitnahController controller,
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
}
