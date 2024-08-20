import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/views/screens/client/client_views.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

class OpenClientAppointments extends StatelessWidget {
  const OpenClientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return messageContainer(context: context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageContainer({
    required BuildContext context,
  }) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).h,
      child: GestureDetector(
        onTap: () {
          Get.to(() => const AcceptDeclineClientAppointments());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.kcPrimaryBlueColor,
          ),
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Column(
                children: [
                  tileOption(
                    image: 'assets/icons/calender.svg',
                    title: "Today (05.08)",
                  ),
                  tileOption(
                    image: 'assets/icons/clock.svg',
                    title: "09:00 - 09:20",
                  ),
                  tileOption(
                    image: 'assets/icons/calender.svg',
                    title: "Peter Weiß",
                  ),
                ],
              )),
              CircleAvatar(
                radius: 40.r,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tileOption({required String image, required String title}) {
    return SizedBox(
      height: 32.h,
      child: ListTile(
        minVerticalPadding: 0,
        leading: SvgPicture.asset(
          image,
          height: 24.r,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
