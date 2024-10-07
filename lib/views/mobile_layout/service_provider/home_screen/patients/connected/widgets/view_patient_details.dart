import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/services.dart';
import 'package:zeitnah/utils/app_colors/app_colors.dart';

import '../../../../../../../models/models.dart';
import '../../patient_controller.dart';
import 'delete_patient.dart';
import 'notify_widget.dart';
import 'profile_info_tile.dart';

class ViewPatientDetails extends StatelessWidget {
  final UserModel user;
  final bool? isConnected;
  final PatientScreenController? connectedController;
  ViewPatientDetails(
      {super.key,
      required this.user,
      this.isConnected,
      this.connectedController});
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
          title: Text("${user.firstName} ${user.lastName}",
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
              profileInfoTile(label: "Phone Number", data: user.phoneNumber),
              profileInfoTile(label: "E-Mail", data: user.email),
              (size.height * 0.02).verticalSpace,
              Visibility(
                  visible:
                      isConnected != null && isConnected == true ? true : false,
                  child: notifyClient(label: "Client gets notified")),
              (size.height * 0.02).verticalSpace,
              Visibility(
                  visible:
                      isConnected != null && isConnected == true ? true : false,
                  child: priorPatient(label: "Priority Client")),
              const Spacer(),
              Visibility(
                visible:
                    isConnected != null && isConnected == true ? true : false,
                child: deletePatient(
                  context,
                  user: user,
                  controller: connectedController,
                ),
              ),
              (size.height * 0.05).verticalSpace,
            ],
          ),
        ));
  }
}
