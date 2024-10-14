import 'package:get/get.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';

import '../../../services/auth_service.dart/auth_service.dart';

class SplashController extends GetxController {
  final _authService = AuthService();
  final DataBaseService _dbService = DataBaseService();

  // this will on start of the splash screen to check for user login

  checkingForUserAuthentication() async {
    final userAuthenticated = _authService.isUserLogin();

    if (userAuthenticated.isSuccess == false) {
      // if user is null
      //  go to login
      Get.offAllNamed(RouterHelperService.login);
    } else {
      // if user is not null
      //  check for patient or clinic
      await getUserDetails(userAuthenticated.userUid);
    }
  }

  // getting user details
  Future<void> getUserDetails(String userId) async {
    final isPatient = await _authService.isPatient(userUid: userId);

    if (isPatient != null) {
      // if user is Patient
      //  get patient required Data

      await getPatientData();
      Get.offAllNamed(RouterHelperService.clientHomeScreen);
    } else {
      // if user is clinic
      //  get Clinic required Data

      final isClinic = await _authService.isClinic(userUid: userId);

      await getAllDataForClinic(isClinic!);

      Get.offAllNamed(RouterHelperService.serviceProviderHomeScreen);
    }
  }

  // Getting data for clinic user

  Future<void> getAllDataForClinic(ClinicModel clinicModel) async {
    getPatientsData(clinicModel);
    await getAppointment();

    await getProviderTeamMember();
    return;
  }

  Future<void> getProviderTeamMember() async {
    _dbService.getProviderTeamMembers();
  }

  Future<void> getPatientData() async {
    _dbService.getAllClinics();
    await _dbService.getAppointmentDataForPatient();
    await _dbService.getAllFollowedClinicByPatient();
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
