import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  // Clinic followed by a patient
  RxList<ClinicModel> patientFollowedClinic = RxList<ClinicModel>();

//  all clinics
  RxList<ClinicModel> allClinic = RxList<ClinicModel>();

// Scanned  QR Code Value

  RxString scannedQrCodeValue = RxString('');

  // For Clinic Members
  // RxList<String> memberList = RxList<String>();

//   open appointment from favourite clinic for patient

  RxList<AppointmentModel> acceptedAppointmentForPatient = RxList();
  RxList<AppointmentModel> openAppointmentForPatient = RxList();

//   request clinic ids for patients
  RxList<String> requestedClinicIds = RxList<String>();
//   followed clinic ids for patients
  RxList<String> followedClinicIds = RxList<String>();

//   For images
  Rxn<XFile> pickedImage = Rxn<XFile>(null);
  RxBool imageLoading = RxBool(false);
}
