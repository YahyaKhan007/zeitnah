import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/apointments/controller/appointment_controller_for_client.dart';

import '../../../../models/models.dart';
import '../../../../services/auth_service.dart/auth_service.dart';
import '../../../../services/router_service/router_helper_service.dart';

class LoginController extends GetxController {
  final _authService = AuthService();
  final DataBaseService _dbService = DataBaseService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final isLoading = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;

    try {
      final result = await _authService.loginUser(
          email: emailController.text,
          password: passController.text,
          from: 'mobile_view');

      if (result.isSuccess) {
        // for clinic
        if (result.clinicModel != null) {
          _dbService.getAllClinicAppointments();

          // getPatientsData(result.clinicModel!);

          Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
        } else {
          // for patient
          // await Get.find<OpenControllerForOpenAppointment>()
          //     .gettingFreeTimeAppointments();
          await getPatientData();
          Get.offAllNamed(RouterHelperService.clientHomeScreen);
        }
      }
    } catch (e) {
      // Handle any errors
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPatientData() async {
    final controller = Get.find<AppointmentControllerForClient>();
    _dbService.getAllClinics();
    await _dbService.getAppointmentDataForPatient(controller: controller);
    await _dbService.getAllFollowedClinicByPatient();
  }

  getPatientsData(ClinicModel clinicModel) async {
    _dbService.getProviderTeamMembers();
    await _dbService.getAllPatientsData(clinicModel: clinicModel);
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
