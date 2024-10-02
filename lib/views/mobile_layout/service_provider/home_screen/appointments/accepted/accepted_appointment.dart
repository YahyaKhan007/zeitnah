import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../app_view.dart';

class AcceptedAppointments extends StatelessWidget {
  const AcceptedAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            cancelAppointment(
                date: "Today (05.08)",
                drName: "Chris Beyers",
                time: "9:00 - 9:20",
                onCancel: () {
                  confirmCancelAppointment(context: context);
                },
                size: size),
            cancelAppointment(
                date: "Today (05.08)",
                drName: "Chris Beyers",
                time: "9:00 - 9:20",
                onCancel: () {
                  confirmCancelAppointment(context: context);
                },
                size: size)
          ],
        ),
      ),
    );
  }
}

Widget cancelAppointment({
  required String drName,
  required String time,
  required String date,
  required Size size,
  required VoidCallback onCancel,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24).h,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        border: Border.all(
          color: AppColors.kcGreyColor,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.kcPrimaryBlueColor,
                  borderRadius: BorderRadius.circular(
                    48.r,
                  ),
                ),
                child: Center(
                  child: Text(
                    drName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              8.h.verticalSpace,
              Text(
                time,
                style: TextStyle(
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              8.h.verticalSpace,
              Text(
                date,
                style: TextStyle(
                    color: AppColors.kcPrimaryBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onCancel,
                child: CircleAvatar(
                  backgroundColor: AppColors.kcPrimaryBlackColor,
                  radius: 12.r,
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}
