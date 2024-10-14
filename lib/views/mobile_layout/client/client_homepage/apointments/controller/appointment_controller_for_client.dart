import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/models/clinic_model/clinic_model.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/database_service.dart/db_service.dart';

class AppointmentControllerForClient extends GetxController {
  final dataController = Get.find<ZeitnahDataController>();
  final DataBaseService _dbService = DataBaseService();

  Future<ClinicModel> gettingClinicNameFromAppointment(
      AppointmentModel appointment) async {
    final clinic = await _dbService.getClinicByUid(appointment.clinicId!);

    return clinic!;
  }

// Open Side

// Accepted Side
}
