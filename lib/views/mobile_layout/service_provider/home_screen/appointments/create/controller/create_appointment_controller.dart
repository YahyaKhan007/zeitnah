import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';
import 'package:zeitnah/services/snackbar_service/snackbar_service.dart';

import '../../../../../../../main.dart';
import '../../../../../../../services/router_service/router_helper_service.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';

class CreateAppointmentController extends GetxController {
  final SnackBarService _snackBarService = SnackBarService();
  final DataBaseService _dbService = DataBaseService();

  final controller = Get.find<ZeitnahDataController>();
  // For showing data

  RxString showAppointmentDate = RxString('Today');
  RxString showAppointmentStartTime = RxString('Select Time');
  RxString showAppointmentEndTime = RxString('End Time');
  RxString showAppointmentSelectedWorker = RxString('Select Worker (optional)');

  // Actual Data
  Rx<DateTime> appointmentDate = Rx<DateTime>(DateTime.now());
  Rxn<DateTime> appointmentStartTime = Rxn<DateTime>(null);
  Rxn<DateTime> appointmentEndTime = Rxn<DateTime>(null);

  RxnString selectWorker = RxnString(null);
  RxBool isPriority = RxBool(false);
  RxBool customPriority = RxBool(false);
  RxInt priorityTime = RxInt(0);

  RxBool isLoading = RxBool(false);

  updateAppointment() async {
    if (appointmentStartTime.value == null) {
      _snackBarService.showErrorSnackBar(
          message: "Start Date can not be empty", title: "Empty Fields");
    } else {
      isLoading.value = true;
      final uid = uuid.v4();
      AppointmentModel appointmentModel = _createAppointmentModel(
          acceptedBy: '',
          clinicId: controller.currentLoggedInClinic.value!.uid,
          uid: uid,
          startTime: appointmentStartTime.value!,
          endTime: appointmentEndTime.value!,
          notificationStatus: '',
          workerName: selectWorker.value ?? '',
          priorityTime: priorityTime.value,
          patientIds: []);

      try {
        final result =
            await _dbService.addAppointmentToFireStore(appointmentModel);

        if (!result) return;

        _snackBarService.showSuccessSnackBar(
            message: "Appointment has been successfully created",
            title: "Appointment Created");
        isLoading.value = false;
        Get.toNamed(RouterHelperService.appointmentCreated, arguments: {
          "clinicName": "Bilal Hospital",
          "appointmentTime":
              "$showAppointmentStartTime - $showAppointmentEndTime",
          "worker": selectWorker.value,
          'date':
              "${showAppointmentDate.value == 'Today' || showAppointmentDate.value == 'Tomorrow' ? showAppointmentDate : ''}(${DateFormat('dd.MM').format(appointmentDate.value)})"
        });
      } catch (e, stackTrace) {
        isLoading.value = false;
        log("StackTrace : $stackTrace");
      }
    }
  }

  _createAppointmentModel({
    required String uid,
    required String acceptedBy,
    required String clinicId,
    required DateTime startTime,
    required DateTime endTime,
    required String notificationStatus,
    required String workerName,
    required int priorityTime,
    required List<String> patientIds,
  }) {
    return AppointmentModel(
        uid: uid,
        acceptedBy: acceptedBy,
        endTime: endTime,
        clinicId: clinicId,
        startTime: startTime,
        notificationStatus: notificationStatus,
        patientsIds: patientIds,
        workerName: workerName,
        priorityTime: priorityTime);
  }

  clearAppointmentDetails() {
    appointmentDate.value = DateTime.now();
    appointmentStartTime.value = null;
    selectWorker.value = null;
    appointmentEndTime.value = null;
    isPriority.value = false;
    priorityTime.value = 0;
  }

  Widget returnTextToShow({required String label}) {
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(const Duration(days: 1));
    switch (label) {
      case 'Today':
        if (appointmentDate.value.year == today.year &&
            appointmentDate.value.month == today.month &&
            appointmentDate.value.day == today.day) {
          showAppointmentDate.value = 'Today';
        } else if (appointmentDate.value.year == tomorrow.year &&
            appointmentDate.value.month == tomorrow.month &&
            appointmentDate.value.day == tomorrow.day) {
          showAppointmentDate.value = 'Tomorrow';
        } else {
          showAppointmentDate.value =
              DateFormat('yyyy-MM-dd').format(appointmentDate.value);
        }

        return Text(
          showAppointmentDate.value,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.kcPrimaryBlackColor,
          ),
        );

      case 'Start Time':
        if (appointmentStartTime.value == null) {
          showAppointmentStartTime.value = "Start Time";
        } else {
          showAppointmentStartTime.value =
              DateFormat('HH:mm ').format(appointmentStartTime.value!);
        }

        return Text(
          showAppointmentStartTime.value.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.kcPrimaryBlackColor,
          ),
        );

      case 'End Time':
        if (appointmentEndTime.value == null) {
          showAppointmentEndTime.value = "End Time";
        } else {
          showAppointmentEndTime.value =
              DateFormat('HH:mm ').format(appointmentEndTime.value!);
        }

        return Text(
          showAppointmentEndTime.value.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.kcPrimaryBlackColor,
          ),
        );

      case 'Select Worker (optional)':
        if (selectWorker.value == null) {
          showAppointmentSelectedWorker.value = 'Select Worker (optional)';
        } else {
          showAppointmentSelectedWorker.value = selectWorker.value!;
        }

        return Text(
          showAppointmentSelectedWorker.value.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.kcPrimaryBlackColor,
          ),
        );
      default:
        return const Text("Default");
    }
  }
}
