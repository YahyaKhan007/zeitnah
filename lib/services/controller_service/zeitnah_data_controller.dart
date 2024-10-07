import 'package:get/get.dart';
import 'package:zeitnah/models/models.dart';

import '../../models/appointment_model/appointment_model.dart';

class ZeitnahDataController extends GetxController {
  RxList<AppointmentModel> providerOpenAppointment = RxList<AppointmentModel>();
  RxList<AppointmentModel> providerAcceptedAppointment =
      RxList<AppointmentModel>();

  Rxn<UserModel> currentLoggedInPatent = Rxn<UserModel>();
  Rxn<ClinicModel> currentLoggedInClinic = Rxn<ClinicModel>();

  RxList<UserModel> requestToSubscribeClinicUserList = RxList<UserModel>();
  RxList<UserModel> favouriteClinicUserList = RxList<UserModel>();
}
