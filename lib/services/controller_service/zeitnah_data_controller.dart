import 'package:get/get.dart';
import 'package:zeitnah/models/models.dart';

import '../../models/appointment_model/appointment_model.dart';

class ZeitnahDataController extends GetxController {
  RxList<AppointmentModel> providerOpenAppointment = RxList<AppointmentModel>();
  RxList<AppointmentModel> providerAcceptedAppointment =
      RxList<AppointmentModel>();

  Rxn<PatientUserModel> currentLoggedInPatient = Rxn<PatientUserModel>();
  Rxn<ClinicModel> currentLoggedInClinic = Rxn<ClinicModel>();

  RxList<PatientUserModel> requestToSubscribeClinicUserList =
      RxList<PatientUserModel>();
  RxList<PatientUserModel> favouriteClinicUserList = RxList<PatientUserModel>();

  RxList<String> providerTeamMembers = RxList<String>();

  // Patient Followed Clinics
  RxList<ClinicModel> patientFollowedClinic = RxList<ClinicModel>();

//  all clinics
  RxList<ClinicModel> allClinic = RxList<ClinicModel>();

  RxList<String> sentRequestToClinicForFavourite = RxList();

// Scanned  QR Code Value

  RxString scannedQrCodeValue = RxString('');

  // For Clinic Members
  RxList<String> memberList = RxList<String>();
}
