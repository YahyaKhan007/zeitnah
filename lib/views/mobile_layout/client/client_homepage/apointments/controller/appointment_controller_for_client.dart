import 'dart:developer';

import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';

import '../../../../../../models/appointment_model/appointment_model.dart';
import '../../../../../../models/models.dart';
import '../../../../../../services/database_service.dart/db_service.dart';
import '../../../../../widgets/formatting.dart';

class AppointmentControllerForClient extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();
  RxBool isLoading = RxBool(false);
  Future<ClinicModel> gettingClinicNameFromAppointment(
      AppointmentModel appointment) async {
    final clinic = await _dbService.getClinicByUid(appointment.clinicId!);

    return clinic!;
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
        dataController.openAppointmentForPatient.add(appointment);

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
  // bool isAppointmentWithinFreeSlot(DateTime appointmentStart,
  //     DateTime appointmentEnd, Map<String, dynamic> freeSlot) {
  //   final freeSlotStart = freeSlot['start'];
  //   final freeSlotEnd = freeSlot['end'];
  //
  //   log("Run Time Type  : $freeSlotStart");
  //
  //   // DateTime freeSlotStart = DateTime.parse(freeSlot['start']);
  //   // DateTime freeSlotEnd = DateTime.parse(freeSlot['end']);
  //
  //   log("appointment start time : ${formatTime(time: appointmentStart)}");
  //   log("appointment end Slot time : ${formatTime(time: appointmentEnd)}");
  //   //
  //   log(" Slot time : ${formatTime(time: freeSlotStart.toDate()).toString()}");
  //   log(" Slot time : ${formatTime(time: freeSlotEnd.toDate()).toString()}");
  //
  //   // bool isInSlot = appointmentStart.isAfter(freeSlotStart.toDate()) &&
  //   //     appointmentEnd.isBefore(freeSlotEnd.toDate());
  //
  //   bool isInSlot = isTimeInSlot(
  //       appointmentEnd: appointmentEnd,
  //       appointmentStart: appointmentStart,
  //       freeSlotEnd: freeSlotStart.toDate(),
  //       freeSlotStart: freeSlotEnd.toDate());
  //
  //   log("The appointment is in slot : $isInSlot");
  //
  //   return isInSlot;
  // }

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
