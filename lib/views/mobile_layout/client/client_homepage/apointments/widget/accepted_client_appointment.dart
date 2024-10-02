import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

class AcceptedClientAppointment extends StatelessWidget {
  const AcceptedClientAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
        radius: const Radius.circular(40),
        thickness: 6,
        thumbVisibility: true,
        child: SizedBox(
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
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.kcPrimaryBlueColor,
          ),
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.only(bottom: 0.h, left: 16.w, right: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              8.h.verticalSpace,
              Text(
                "Bilal Hospital",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              8.h.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        image: 'assets/icons/user_box.svg',
                        title: "Peter Weiß",
                      ),
                    ],
                  )),
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundColor: AppColors.kcPrimaryBlueColor,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 48.r,
                      ),
                    ),
                  ),
                  8.w.horizontalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileOption({required String image, required String title}) {
    return SizedBox(
        height: 24.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              height: 18.r,
              color: Colors.white,
            ),
            16.w.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )

        // ListTile(
        //   minVerticalPadding: 0,
        //   leading:
        //   title: Text(
        //     title,
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 12.sp,
        //         fontWeight: FontWeight.w300),
        //   ),
        // ),
        );
  }
}
