import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../qr_code_scanner/qr_code_scanner.dart';

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
      if (clinic.email.contains(query)) {
        searchClinics.add(clinic);
      }
    }
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

  @override
  void onInit() {
    super.onInit();

    searchController.addListener(() {});
  }
}
