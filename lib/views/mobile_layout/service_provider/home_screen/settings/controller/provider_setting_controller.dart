import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../../../utils/app_colors/app_colors.dart';

class ProviderSettingController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();

  RxInt customPriorityTimeForClinicAppointment = RxInt(0);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  removeTeamMember(int index) {
    _dbService.removeTeamMemberFromProvider(
        member: dataController.providerTeamMembers[index]);

    dataController.providerTeamMembers.removeAt(index);
  }

  Widget showTrailingText(String label) {
    switch (label) {
      case 'Custom Time':
        return Obx(
          () => Text('${customPriorityTimeForClinicAppointment.value} min',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kcPrimaryBlueColor,
                      fontWeight: FontWeight.bold))),
        );

      case 'Team Member':
        return Obx(
          () => Text('${dataController.providerTeamMembers.length}',
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
