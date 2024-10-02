import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentFreeSlotController extends GetxController {
  Rxn<DateTime> appointmentDate = Rxn<DateTime>(null);
  Rxn<TimeOfDay> appointmentStartTime = Rxn<TimeOfDay>(null);
  Rxn<TimeOfDay> appointmentEndTime = Rxn<TimeOfDay>(null);

  RxString selectWorker = RxString("");
  RxBool isPriority = RxBool(false);
}
