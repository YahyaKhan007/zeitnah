import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import 'widgets/delete_appointment.dart';

class OpenAppointments extends StatelessWidget {
  const OpenAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      child: Column(
        children: [
          openAppointment(
              date: 'Today (05.08)',
              onDelete: () {
                deleteAppointment(context: context);
              },
              time: '9:00 - 9:20',
              size: size),
          openAppointment(
              date: 'Today (05.08)',
              onDelete: () {
                deleteAppointment(context: context);
              },
              time: '18:00 - 18:20',
              size: size),
        ],
      ),
    ));
  }

  Widget openAppointment(
      {required String date,
      required Size size,
      required String time,
      required VoidCallback onDelete}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24).h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            48.r,
          ),
          border: Border.all(
            color: AppColors.kcGreyColor,
          ),
        ),
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  icon: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: AppColors.kcPrimaryBlackColor,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: onDelete,
                )),
          ],
        ),
      ),
    );
  }
}