import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/controller_service.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:zeitnah/utils/app_constants.dart';

import '../patient_views.dart';

class PatientConnected extends StatelessWidget {
  PatientConnected({super.key});
  final controller = Get.find<ZeitnahController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 8).w,
        child: CupertinoScrollbar(
          thickness: 4.w,
          radius: Radius.circular(40.r),
          thumbVisibility: true,
          child: ListView.builder(
            itemCount: AppConstants.workersList.length,
            itemBuilder: (context, index) {
              return patientName(
                drName: AppConstants.workersList[index],
                index: index,
                onTap: () {
                  Get.to(
                    () => ViewPatientDetails(
                      name: AppConstants.workersList[index],
                    ),
                    duration: const Duration(milliseconds: 300),
                    transition: Transition.rightToLeft,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget patientName(
      {required String drName,
      required VoidCallback onTap,
      String? image,
      required int index}) {
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
                ? SvgPicture.asset(
                    "assets/icons/bell_off.svg",
                    // color: Colors.black,
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.isPriority.value =
                              !controller.isPriority.value;
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.kcPrimaryBackgrundColor,
                          child: SvgPicture.asset(
                            'assets/icons/diomond.svg',
                            color: controller.isPriority.value == true
                                ? const Color(0xffC4B420)
                                : Colors.black,
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
}
