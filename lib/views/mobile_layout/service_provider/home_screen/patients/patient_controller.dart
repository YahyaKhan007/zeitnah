import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/models.dart';
import '../../../../../services/controller_service/zeitnah_data_controller.dart';
import '../../../../../services/database_service.dart/db_service.dart';

class PatientScreenController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();
  Rx<TextEditingController> searchController = TextEditingController().obs;

  final RxString searchText = ''.obs;

  RxInt selectedClientPatientPageIndex = RxInt(1);
  PageController pageController = PageController();

  RxList<PatientUserModel> searchRequestUsers = RxList<PatientUserModel>();
  RxList<PatientUserModel> searchConnectedUsers = RxList<PatientUserModel>();

  acceptUserRequest({required PatientUserModel user}) async {
    await _dbService.acceptUserRequestForToSubscribe(user: user);
  }

  rejectUserRequest({required PatientUserModel user}) async {
    await _dbService.rejectUserRequestForToSubscribe(user: user);
  }

  deleteConnectedUser(PatientUserModel user) async {
    await _dbService.deleteConnectedFirebase(user: user);
  }

  // void updateSearchText(String value) {
  //   searchText.value = value;
  //
  //
  // }

  updateSearchText(String query) {
    searchText.value = query;

    searchRequestUsers.clear();
    searchConnectedUsers.clear();

    switch (selectedClientPatientPageIndex.value) {
      case 0:
        log("Connected");
        log(dataController.favouriteClinicUserList.length.toString());
        for (var user in dataController.favouriteClinicUserList) {
          if ("${user.firstName} ${user.lastName}".contains(query)) {
            log("Found one");

            if (!searchConnectedUsers.contains(user)) {
              log("adding the value");
              searchConnectedUsers.add(user);
            }
          }
        }

        log("The length of connected user search is :  ${searchConnectedUsers.length}");

        break;

      case 1:
        log("Requested");
        log(dataController.requestToSubscribeClinicUserList.length.toString());
        for (var user in dataController.requestToSubscribeClinicUserList) {
          if ("${user.firstName} ${user.lastName}".contains(query)) {
            if (!searchRequestUsers.contains(user)) {
              searchRequestUsers.add(user);
            }
          }
          break;
        }
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // Add listener to search controller to call searchQuery
  //   // searchController.value.addListener(() {
  //   //   searchQuery(searchController.value.text);
  //   // });
  //   log("Init called");
  //
  //   // Call the initial search query to trigger update
  //   searchQuery("");
  //
  //   // Force an initial update
  //   update();
  // }
}
