import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/custome_button_with_icon.dart';
import '../qr_code_scanner/qr_code_scanner.dart';
import '../widgets/ui_functions.dart';

class AddServiceProvideController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();

  TextEditingController searchController = TextEditingController();

  RxList<ClinicModel> searchClinics = RxList<ClinicModel>();

  RxBool isSend = RxBool(false);

  searchClinic(dynamic query) {
    searchClinics.clear();

    print("Query   :  ${dataController.allClinic.length}");

    for (var clinic in dataController.allClinic) {
      print("Clinic   :  ${clinic.email}");
      print("Query   :  $query");
      if (clinic.clinicName.contains(query)) {
        searchClinics.add(clinic);
      }
    }
  }

  deleteProvider({required ClinicModel clinic}) async {
    _dbService.deleteProviderFromPatient(clinic: clinic);
    Get.back();
    Get.back();
  }

  getClinicFuture({required String uid}) async {
    final clinic = await _dbService.getClinicByUid(uid);
    return clinic;
  }

  sendRequest(ClinicModel clinicModel) async {
    await _dbService.sendRequestToClinicForFavourite(
        clinicModel: clinicModel,
        currentUser: dataController.currentLoggedInPatient.value!,
        label: "request");
  }

  cancelRequest(ClinicModel clinicModel) async {
    await _dbService.sendRequestToClinicForFavourite(
        clinicModel: clinicModel,
        currentUser: dataController.currentLoggedInPatient.value!,
        label: "cancel");
  }

  scanQrCode() async {
    Get.to(() => const QrCodeScanner());
  }

  Widget multipleFunctionalButtonForClinicProfile(
      {required ClinicModel clinicModel,
      required BuildContext context,
      required Size size}) {
    if (dataController.followedClinicIds.contains(clinicModel.uid)) {
      log("delete Button");
      return GestureDetector(
        onTap: () {
          deleteClinic(context: context, controller: this, clinic: clinicModel);
        },
        child: SvgPicture.asset(
          "assets/icons/delet.svg",
        ),
      );
    } else if (dataController.requestedClinicIds.contains(clinicModel.uid)) {
      log("request sent Button");
      //
      return customButtonWithIconForSendRequest(
          controller: this,
          backGroundColor: AppColors.kcgreyFieldColor,
          textColor: Colors.white,
          text: "Request Sent",
          size: size,
          image: null,
          imageColor: Colors.white,
          borderRadius: 40.r,
          onTap: () {
            cancelRequest(clinicModel);
          });
    }

    log("add request Button");
    return customButtonWithIconForSendRequest(
      controller: this,
      backGroundColor: AppColors.kcPrimaryBlueColor,
      textColor: Colors.white,
      text: "Add Service Provider",
      size: size,
      image: "assets/icons/add_member.svg",
      imageColor: Colors.white,
      borderRadius: 40.r,
      onTap: () {
        sendRequest(clinicModel);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    searchController.addListener(() {});
  }
}
