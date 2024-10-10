import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/views/mobile_layout/service_provider/home_screen/patients/patient_controller.dart';

class PatientConnected extends GetView<PatientScreenController> {
  const PatientConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(
        () => controller.dataController.favouriteClinicUserList.isEmpty
            ? Center(
                child: Text(
                  'No Connected Patients',
                  style: TextStyle(
                      fontSize: 12.sp, color: AppColors.kcPrimaryBlackColor),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 8).w,
                child: CupertinoScrollbar(
                  thickness: 4.w,
                  radius: Radius.circular(40.r),
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: controller
                        .dataController.favouriteClinicUserList.length,
                    itemBuilder: (context, index) {
                      log(controller
                          .dataController.favouriteClinicUserList.length
                          .toString());
                      final user = controller
                          .dataController.favouriteClinicUserList[index];
                      return patientName(
                        drName: "${user.firstName} ${user.lastName}",
                        index: index,
                        onTap: () {
                          // Get.to(
                          //   () => ViewPatientDetails(
                          //     user: user,
                          //     isConnected: true,
                          //     connectedController: controller,
                          //   ),
                          //   duration: const Duration(milliseconds: 300),
                          //   transition: Transition.rightToLeft,
                          // );
                        },
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}

Widget patientName(
    {required String drName,
    required VoidCallback onTap,
    String? image,
    required int index}) {
  final zeitnahController = Get.find<ZeitnahController>();

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      margin: EdgeInsets.only(left: 32.w, right: 24.w, bottom: 16.h),
      height: 40.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: index == 2
            ? AppColors.kcGreyTextColor.withOpacity(0.5)
            : AppColors.kcPrimaryBlueColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: index == 2 ? 40 : 0,
          ),
          Center(
            child: Text(
              drName,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: index == 2 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          index == 2
              ? SvgPicture.asset("assets/icons/bell_off.svg", height: 32.r
                  // color: Colors.black,
                  )
              : Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        zeitnahController.isPriority.value =
                            !zeitnahController.isPriority.value;
                      },
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.kcPrimaryBackgrundColor,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/diomond.svg',
                            height: 20.h,
                            color: zeitnahController.isPriority.value == true
                                ? const Color(0xffC4B420)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    ),
  );
}
