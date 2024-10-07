import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

class ProviderSettingController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();

  RxInt customPriorityTimeForClinicAppointment = RxInt(0);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Widget showTrailingText(String label) {
    switch (label) {
      case 'Custom Time':
        return Obx(
          () => Text('${customPriorityTimeForClinicAppointment.value}min',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold))),
        );

      case 'Team Member':
        return Obx(
          () => Text('${customPriorityTimeForClinicAppointment.value}',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold))),
        );
      default:
        return const Text("");
    }
  }
}
