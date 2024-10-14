import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeitnah/get_storage_keys.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

import '../../../../../../../models/appointment_model/appointment_model.dart';

class AcceptedAppointmentController extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();

  Future<void> cancelAppointment(
      {required AppointmentModel appointment}) async {
    var box = GetStorage();

    box.write(GetStorageKeys.acceptedAppointmentsForClinic,
        box.read(GetStorageKeys.acceptedAppointmentsForClinic) - 1);

    await _dbService.cancelAppointment(appointment: appointment);

    return;
  }
}
