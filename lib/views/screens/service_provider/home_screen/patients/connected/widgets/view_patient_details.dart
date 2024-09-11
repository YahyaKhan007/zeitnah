import 'notify_widget.dart';
import 'delete_patient.dart';
import 'package:get/get.dart';
import 'profile_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ViewPatientDetails extends StatelessWidget {
  final String name;
  ViewPatientDetails({super.key, required this.name});
  final controller = Get.find<ZeitnahController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kcPrimaryBackgrundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16).w,
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
          centerTitle: true,
          title: Text(name,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcPrimaryBlackColor))),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              (size.height * 0.05).verticalSpace,
              profileInfoTile(label: "Phone Number", data: "+4912341234123"),
              profileInfoTile(label: "E-Mail", data: "abcdefg@gmail.com"),
              (size.height * 0.02).verticalSpace,
              notifyClient(label: "Client gets notified"),
              (size.height * 0.02).verticalSpace,
              priorPatient(label: "Priority Client"),
              const Spacer(),
              deletePatient(
                context,
                name: name,
              ),
              (size.height * 0.05).verticalSpace,
            ],
          ),
        ));
  }
}
