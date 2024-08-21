import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeitnah/utils/app_constants.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import 'setting_view.dart';

class PriorityListScreen extends StatelessWidget {
  PriorityListScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: settingAppBar(
        context: context,
        label: "Priority List",
        controller: searchController,
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            16.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: AppConstants.workersList.length,
                  itemBuilder: (context, index) {
                    String name = AppConstants.workersList[index];
                    return patientName(
                        drName: name,
                        onTap: () {},
                        image: 'assets/icons/diomond.svg');
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget patientName(
      {required String drName, required VoidCallback onTap, String? image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        margin: EdgeInsets.only(left: 24.w, right: 16.w, bottom: 16.h),
        height: 48.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.kcPrimaryBlueColor,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Text(
                drName,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            image != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                        backgroundColor: AppColors.kcPrimaryBackgrundColor,
                        child: SvgPicture.asset(image)))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}