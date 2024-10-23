import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';

import '../../../../../../models/appointment_model/appointment_model.dart';
import '../../../../../../models/models.dart';
import '../../../../../../services/database_service.dart/db_service.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../widgets/formatting.dart';

class AppointmentControllerForClient extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService dbService = DataBaseService();
  RxBool isLoading = RxBool(false);

  Widget displayTimeGap(DateTime time) {
    // Get the current time
    Rx<DateTime> now = DateTime.now().obs;
    Rx<Duration> difference = now.value.difference(time).obs;

    // Calculate the difference

    // Extract hours and minutes
    RxInt hours = (difference.value.inHours * -1).obs;
    RxInt minutes = ((difference.value.inMinutes.remainder(60)) * -1)
        .obs; // Get remaining minutes after hours

    // Display the result
    return Text(
      " ${hours.value}:${minutes.value} min",
      style: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: 22.sp,
            color: AppColors.kcGreyTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // _timer?.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }

  Future<ClinicModel> gettingClinicNameFromAppointment(
      AppointmentModel appointment) async {
    final clinic = await dbService.getClinicByUid(appointment.clinicId!);

    return clinic!;
  }

  Rxn<AppointmentModel> observableAppointment = Rxn<AppointmentModel>(null);

  Future<void> rejectAppointment(
      {required AppointmentModel appointment}) async {
    dbService.rejectAppointment(appointment: appointment);
  }

  void willRemoveAppointment(AppointmentModel appointment) {
    if (observableAppointment.value == null) return;
    log("Came to the remove Function");
    if (observableAppointment.value!.acceptedBy != '') {
      dataController.openAppointmentForPatient.remove(appointment);

      log("Value Removed");
    }

    observableAppointment.value = null;
  }

  Future<void> acceptTheOpenAppointment(
      {required AppointmentModel appointment}) async {
    await dbService.acceptAppointmentForClient(appointment: appointment);

    Get.back();
    Get.back();
  }

// 1. Open Side
  Future<void> checkingForOpenAppointment({
    required AppointmentModel appointment,
  }) async {
    // Current Patient user
    PatientUserModel patient = dataController.currentLoggedInPatient.value!;

    // 1. Extract the Appointment Date

    DateTime appointmentStartTime = appointment.startTime!;
    DateTime appointmentEndTime = appointment.endTime!;

    //   2. Determine the Weekday

    int appointmentWeekday =
        appointmentStartTime.weekday; // Monday = 1, Sunday = 7

    // 3. Retrieve Free Slots for the Day

    String dayKey = getWeekdayString(appointmentWeekday);

    log("Day is : $dayKey");
    List<dynamic> freeSlotsForDay = patient.freeSlots[dayKey];

    // 4. Compare Appointment Time with Free Slot Times

    for (var slot in freeSlotsForDay) {
      if (isAppointmentWithinFreeSlot(
          appointmentStartTime, appointmentEndTime, slot)) {
        if (dataController.openAppointmentForPatient.contains(appointment)) {
          break;
        } else {
          dataController.openAppointmentForPatient.add(appointment);
        }
        print('Appointment ID: ${appointment.uid}');
        break;
        // break;
      }
    }
  }

  // Retrieve Free Slots for the Day
  String getWeekdayString(int weekday) {
    switch (weekday) {
      case 1:
        return 'monday';
      case 2:
        return 'tuesday';
      case 3:
        return 'wednesday';
      case 4:
        return 'thursday';
      case 5:
        return 'friday';
      case 6:
        return 'saturday';
      case 7:
        return 'sunday';
      default:
        return '';
    }
  }

  // Compare Appointment Time with Free Slot Times
  bool isAppointmentWithinFreeSlot(DateTime appointmentStart,
      DateTime appointmentEnd, Map<String, dynamic> freeSlot) {
    final freeSlotStart =
        freeSlot['start'].toDate(); // Assuming freeSlot['start'] is a Timestamp
    final freeSlotEnd =
        freeSlot['end'].toDate(); // Assuming freeSlot['end'] is a Timestamp

    log("Run Time Type: ${freeSlotStart.runtimeType}");

    // Logging the appointment and free slot times
    log("Appointment start time: ${formatTime(time: appointmentStart)}");
    log("Appointment end time: ${formatTime(time: appointmentEnd)}");
    log("Free slot start time: ${formatTime(time: freeSlotStart)}");
    log("Free slot end time: ${formatTime(time: freeSlotEnd)}");

    // Check if the appointment times are within the free slot
    bool isInSlot = isTimeInSlot(
      appointmentStart: appointmentStart,
      appointmentEnd: appointmentEnd,
      freeSlotStart: freeSlotStart,
      freeSlotEnd: freeSlotEnd,
    );

    log("The appointment is in slot: $isInSlot");

    return isInSlot;
  }

  bool isTimeInSlot({
    required DateTime appointmentStart,
    required DateTime appointmentEnd,
    required DateTime freeSlotStart,
    required DateTime freeSlotEnd,
  }) {
    // Extract the time components from the DateTime objects
    final appointmentStartHour = appointmentStart.hour;
    final appointmentStartMinute = appointmentStart.minute;
    final appointmentEndHour = appointmentEnd.hour;
    final appointmentEndMinute = appointmentEnd.minute;

    final freeSlotStartHour = freeSlotStart.hour;
    final freeSlotStartMinute = freeSlotStart.minute;
    final freeSlotEndHour = freeSlotEnd.hour;
    final freeSlotEndMinute = freeSlotEnd.minute;

    // Check if the appointment start time is after or equal to the free slot start time
    bool startsAfterFreeSlot = (appointmentStartHour > freeSlotStartHour) ||
        (appointmentStartHour == freeSlotStartHour &&
            appointmentStartMinute >= freeSlotStartMinute);

    // Check if the appointment end time is before or equal to the free slot end time
    bool endsBeforeFreeSlot = (appointmentEndHour < freeSlotEndHour) ||
        (appointmentEndHour == freeSlotEndHour &&
            appointmentEndMinute <= freeSlotEndMinute);

    return startsAfterFreeSlot && endsBeforeFreeSlot;
  }

// Accepted Side

  Future<bool> gettingFreeTimeAppointments(AppointmentModel appointment) async {
    // dataController.openAppointmentForPatient.clear();

    await Future.delayed(const Duration(seconds: 1));

    // totalOpenAppointments.map(
    //     (appointment) => checkingForOpenAppointment(appointment: appointment));

    checkingForOpenAppointment(appointment: appointment);

    return true;
  }
}
