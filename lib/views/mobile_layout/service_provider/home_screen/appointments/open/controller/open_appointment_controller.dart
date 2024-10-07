import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../../../../models/appointment_model/appointment_model.dart';
import '../../../../../../../services/controller_service/zeitnah_data_controller.dart';

class OpenAppointmentController extends GetxController {
  final streamCollection =
      FirebaseFirestore.instance.collection("collectionPath").snapshots();

  final DataBaseService _dbService = DataBaseService();

  final zeitnahDataController = Get.find<ZeitnahDataController>();

  Future<void> deleteAppointment(
      {required AppointmentModel appointment}) async {
    await _dbService.deleteAppointment(appointment: appointment);
    return;
  }
}
