import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import '../../../../../../../utils/app_constants.dart';
import '../../connected/widgets/view_patient_details.dart';
import 'ui_functions.dart';

class AcceptDeclineRequest extends StatelessWidget {
  final int index;
  const AcceptDeclineRequest({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 40.h,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: AppColors.kcGreyTextColor.withOpacity(0.3)),
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
      padding: EdgeInsets.all(6.r),
      child: Row(
        children: [
          optionButton(
              onTap: () {
                patientRequestAccepted(context: context, name: "Alex Bright");
              },
              backColor: AppColors.kcPrimaryBlueColor,
              iconColor: Colors.white,
              image: 'assets/icons/check.png'),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.to(
                  () => ViewPatientDetails(
                    name: AppConstants.workersList[index],
                  ),
                  duration: const Duration(milliseconds: 300),
                  transition: Transition.rightToLeft,
                );
              },
              child: Center(
                child: Text(
                  "Alex Bright",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryBlackColor),
                ),
              ),
            ),
          ),
          optionButton(
              onTap: () {
                rejectPatientRequest(
                    context: context,
                    name: "Alex Bright",
                    no: () {
                      Get.back();
                    },
                    yes: () {
                      Get.back();
                    });
              },
              backColor: AppColors.kcPrimaryBlackColor,
              iconColor: Colors.white,
              image: null)
        ],
      ),
    );
  }

  Widget optionButton(
      {required VoidCallback onTap,
      required Color backColor,
      required Color iconColor,
      String? image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r), color: backColor),
        width: 80.w,
        child: Center(
          child: image == null
              ? const Icon(
                  Icons.close,
                  color: Colors.white,
                )
              : Image.asset(image),
        ),
      ),
    );
  }
}
