import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/utils/app_constants.dart';
import 'package:zeitnah/views/widgets/custome_button_with_icon.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import 'widgets/ui_functions.dart';

class HospitalProfileFromPatientSide extends StatefulWidget {
  final ProviderModel model;
  final bool isAdd;
  const HospitalProfileFromPatientSide(
      {super.key, required this.model, required this.isAdd});

  @override
  State<HospitalProfileFromPatientSide> createState() =>
      _HospitalProfileFromPatientSideState();
}

class _HospitalProfileFromPatientSideState
    extends State<HospitalProfileFromPatientSide> {
  bool isSend = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kcPrimaryBackgrundColor,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              color: AppColors.kcPrimaryBlueColor,
            ),
          ),
        ),
        title: Text(
          widget.model.name,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: AppColors.kcPrimaryBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 64.r,
              backgroundColor: AppColors.kcPrimaryBlackColor,
              child: CircleAvatar(
                radius: 62.r,
                backgroundColor: AppColors.kcPrimaryBlueColor,
                backgroundImage: AssetImage(widget.model.image),
              ),
            ),
            24.h.verticalSpace,
            profileFieldOption(
                label: "Address", data: "4 Pitras , H 8/4 H-8, , Islamabad"),
            profileFieldOption(label: "Phone Number", data: "+4912341234123"),
            profileFieldOption(label: "E-Mail", data: "abcdefg@gmail.com"),
            32.h.verticalSpace,
            widget.isAdd
                ? GestureDetector(
                    onTap: () {
                      deleteHospital(context: context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/delet.svg",
                    ),
                  )
                : customeButtonWithIcon(
                    backGroundColor: isSend
                        ? AppColors.kcGreyTextColor
                        : AppColors.kcPrimaryBlueColor,
                    textColor: Colors.white,
                    text: "Add Service Provider",
                    size: size,
                    image: isSend
                        ? "assets/icons/sent.svg"
                        : "assets/icons/add_member.svg",
                    imageColor: Colors.white,
                    borderRadius: 40.r,
                    onTap: () {
                      isSend = !isSend;
                      setState(() {});
                    })
          ],
        ),
      ),
    );
  }

  Widget profileFieldOption({
    required String label,
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: AppColors.kcGreyTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
          8.h.verticalSpace,
          Container(
            height: 40.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.kcGreyColor,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Text(
                data,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
