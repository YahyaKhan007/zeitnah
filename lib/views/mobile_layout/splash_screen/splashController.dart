import 'package:get/get.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';

import '../../../services/auth_service.dart/auth_service.dart';

class SplashController extends GetxController {
  final _authService = AuthService();
  final DataBaseService _dbService = DataBaseService();

  checkingForUserAuthentication() async {
    final userAuthenticated = _authService.isUserLogin();

    if (userAuthenticated.isSuccess == false) {
      Get.offAllNamed(RouterHelperService.login);
    } else {
      await getUserDetails(userAuthenticated.userUid);
    }
  }

  Future<void> getAllData(ClinicModel clinicModel) async {
    await getAppointment();
    await getPatientsData(clinicModel);
    return;
  }

  // getting user details
  Future<void> getUserDetails(String userId) async {
    final isClinic = await _authService.isClinic(userUid: userId);
    final isPatient = await _authService.isPatient(userUid: userId);

    if (isPatient != null) {
      Get.offAllNamed(RouterHelperService.clientHomeScreen);
    } else if (isClinic != null) {
      await getAllData(isClinic);

      Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
    }
  }

  getPatientsData(ClinicModel clinicModel) async {
    await _dbService.getAllPatientsData(clinicModel: clinicModel);
  }

  getAppointment() async {
    await _dbService.getAllClinicAppointments();
  }

  @override
  void onInit() {
    //
    print("SplashController onReady called!");

    super.onInit();
  }
}
