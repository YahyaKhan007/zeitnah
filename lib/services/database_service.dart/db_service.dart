import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/services/snackbar_service/snackbar_service.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';

import '../../models/models.dart';
import '../../views/mobile_layout/client/client_homepage/add_service_provider/add_pro_views.dart';
import '../controller_service/zeitnah_data_controller.dart';

class DataBaseService {
  final FirebaseFirestore _fireStoreAuth = FirebaseFirestore.instance;

  final dataController = Get.find<ZeitnahDataController>();

  final SnackBarService _snackBarService = SnackBarService();

  // ^   Adding User to FireStore Database

  Future<bool> addPatientToFireStore(
      {required PatientUserModel userData}) async {
    try {
      await _fireStoreAuth
          .collection('users')
          .doc(userData.userId)
          .set(userData.toJson());

      return true;
    } catch (e, stackTrace) {
      log('Error : ${e.toString()}\n\n');
      log('stackTrace : ${stackTrace.toString()}');

      return false;
    }
  }

  Future<bool> addClinicToFireStore({required ClinicModel userData}) async {
    try {
      await _fireStoreAuth
          .collection('clinics')
          .doc(userData.uid)
          .set(userData.toMap());

      return true;
    } catch (e, stackTrace) {
      log('Error : ${e.toString()}\n\n');
      log('stackTrace : ${stackTrace.toString()}');

      return false;
    }
  }

// ^ getting user by uid
  Future<PatientUserModel?> getPatientUserByUid(String uid) async {
    try {
      PatientUserModel? userModel;

      DocumentSnapshot docSnap =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (docSnap.data() != null) {
        userModel =
            PatientUserModel.fromJson(docSnap.data() as Map<String, dynamic>);
      }

      return userModel;
    } catch (e, stackTrace) {
      log("StackTrace : $stackTrace");
      return null;
    }
  }

  // ^ getting user by uid
  Future<ClinicModel?> getClinicByUid(String uid) async {
    try {
      ClinicModel? clinicModel;

      DocumentSnapshot docSnap =
          await FirebaseFirestore.instance.collection("clinics").doc(uid).get();

      if (docSnap.data() != null) {
        clinicModel =
            ClinicModel.fromMap(docSnap.data() as Map<String, dynamic>);
      }

      return clinicModel!;
    } catch (e, stackTrace) {
      log("StackTrace : $stackTrace");
      return null;
    }
  }

  // adding appointment to fireStore

  Future<bool> addAppointmentToFireStore(
      AppointmentModel appointmentModel) async {
    try {
      await _fireStoreAuth
          .collection("appointments")
          .doc(appointmentModel.uid)
          .set(appointmentModel.toJson());

      dataController.providerOpenAppointment.add(appointmentModel);

      return true;
    } catch (e) {
      return false;
    }
  }

  // Getting appointments
  Future<void> getAllClinicAppointments() async {
    dataController.providerOpenAppointment.clear();
    dataController.providerAcceptedAppointment.clear();
    final appointmentData =
        await _fireStoreAuth.collection('appointments').get();

    final data = appointmentData.docs;

    for (var doc in data) {
      final appointmentDoc = AppointmentModel.fromJson(doc.data());

      if (appointmentDoc.clinicId == FirebaseAuth.instance.currentUser!.uid) {
        if (appointmentDoc.acceptedBy!.isEmpty) {
          dataController.providerOpenAppointment.add(appointmentDoc);
        } else {
          dataController.providerAcceptedAppointment.add(appointmentDoc);
        }
      }
    }

    // final box = GetStorage();
    //
    // box.write(GetStorageKeys.acceptedAppointmentsForClinic,
    //     dataController.providerAcceptedAppointment.length);

    return;
  }

  Future<void> getAllPatientsData({required ClinicModel clinicModel}) async {
    for (var userId in clinicModel.favouriteBy) {
      final user = await getPatientUserByUid(userId);
      if (user == null) continue;
      dataController.favouriteClinicUserList.add(user);
    }

    for (var userId in clinicModel.requestForFavourite) {
      final user = await getPatientUserByUid(userId);
      if (user == null) continue;
      dataController.requestToSubscribeClinicUserList.add(user);
    }
  }

//   Delete Appointment

  Future<bool> deleteAppointment(
      {required AppointmentModel appointment}) async {
    try {
      await _fireStoreAuth
          .collection("appointments")
          .doc(appointment.uid)
          .delete();

      dataController.providerOpenAppointment.remove(appointment);

      return true;
    } catch (e, stacktrace) {
      log("stackTrace : $stacktrace");
      return false;
    }
  }

//   Cancel Appointment
  Future<bool> cancelAppointment(
      {required AppointmentModel appointment}) async {
    try {
      log("UID : ${appointment.uid}");
      log(" Accepted by :   ${appointment.acceptedBy.toString()}");

      AppointmentModel appointment1 = appointment;

      appointment1.acceptedBy = "";

      log(" Accepted by :   ${appointment.acceptedBy.toString()}");

      await _fireStoreAuth
          .collection("appointments")
          .doc(appointment1.uid)
          .update(appointment1.toJson());

      dataController.providerOpenAppointment.add(appointment1);
      dataController.providerAcceptedAppointment.remove(appointment);

      return true;
    } catch (e, stacktrace) {
      log("stackTrace : $stacktrace");
      return false;
    }
  }

  // accept User Request For To Subscribe
  Future<bool> acceptUserRequestForToSubscribe(
      {required PatientUserModel user}) async {
    try {
      dataController.requestToSubscribeClinicUserList.remove(user);
      dataController.favouriteClinicUserList.add(user);

      List<String> updateRequestedUsers = [];
      List<String> updateFavouriteUsers = [];
      var updatedUser = dataController.currentLoggedInClinic.value;

      // updateUser!.requestForFavourite =
      for (var user in dataController.requestToSubscribeClinicUserList) {
        updateRequestedUsers.add(user.userId);
      }

      for (var user in dataController.favouriteClinicUserList) {
        updateFavouriteUsers.add(user.userId);
      }

      updatedUser!.requestForFavourite = updateRequestedUsers;
      updatedUser.favouriteBy = updateFavouriteUsers;

      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update(updatedUser.toMap());
    } catch (e, stackTrace) {
      log("StackTrace : $stackTrace");
    }

    return true;
  }

  // reject User Request For To Subscribe

  Future<bool> rejectUserRequestForToSubscribe(
      {required PatientUserModel user}) async {
    try {
      dataController.requestToSubscribeClinicUserList.remove(user);

      List<String> updateRequestedUsers = [];
      var updatedUser = dataController.currentLoggedInClinic.value;

      // updateUser!.requestForFavourite =
      for (var user in dataController.requestToSubscribeClinicUserList) {
        updateRequestedUsers.add(user.userId);
      }

      updatedUser!.requestForFavourite = updateRequestedUsers;

      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update(updatedUser.toMap());
    } catch (e, stackTrace) {
      log("StackTrace : $stackTrace");
    }

    return true;
  }

  // delete connection patient from clinic
  Future<bool> deleteConnectedFirebase({required PatientUserModel user}) async {
    try {
      dataController.favouriteClinicUserList.remove(user);

      List<String> updateFavouriteUsers = [];
      var updatedUser = dataController.currentLoggedInClinic.value;

      for (var user in dataController.favouriteClinicUserList) {
        updateFavouriteUsers.add(user.userId);
      }

      updatedUser!.favouriteBy = updateFavouriteUsers;

      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update(updatedUser.toMap());
    } catch (e, stackTrace) {
      log("StackTrace : $stackTrace");
    }

    return true;
  }

  Future<void> changeCustomTimeForProviderAppointment() async {
    try {
      _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update(dataController.currentLoggedInClinic.value!.toMap());
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
    }
  }

  Future<void> updateClinicProfile() async {
    try {
      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update(dataController.currentLoggedInClinic.value!.toMap());

      return;
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
      return;
    }
  }

  Future<void> deleteAccount() async {
    try {
      log(" current clinic id : ${dataController.currentLoggedInClinic.value!.uid}");
      await _fireStoreAuth
          .collection('clinics')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();

      await FirebaseAuth.instance.currentUser?.delete();

      return;
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
      return;
    }
  }

  Future<void> deleteClientAccount() async {
    try {
      log(" current Patient id : ${dataController.currentLoggedInPatient.value!.userId}");
      await _fireStoreAuth
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();

      // await FirebaseAuth.instance.currentUser?.delete();

      return;
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
      return;
    }
  }

  Future<void> getProviderTeamMembers() async {
    try {
      for (var workerId
          in dataController.currentLoggedInClinic.value!.teamMembers) {
        // final worker = await getPatientUserByUid(workerId);
        dataController.providerTeamMembers.add(workerId);
      }

      log("Workers captured  :  ${dataController.providerTeamMembers}");
    } catch (e, stackTrac) {
      log("stackTrace : $stackTrac");
    }
  }

  Future<void> getAllFollowedClinicByPatient() async {
    dataController.patientFollowedClinic.clear();
    try {
      log("Total followed Clinic are   :  ${dataController.currentLoggedInPatient.value!.followedClinics.length}");
      for (var workerId
          in dataController.currentLoggedInPatient.value!.followedClinics) {
        final clinicModel = await getClinicByUid(workerId);
        dataController.patientFollowedClinic.add(clinicModel!);
        dataController.sentRequestToClinicForFavourite.add(clinicModel.uid);
      }

      log("Clinic captured  :  ${dataController.patientFollowedClinic.length}");
    } catch (e, stackTrac) {
      log("stackTrace : $stackTrac");
    }
  }

  Future<void> getAllClinics() async {
    try {
      final querySnapshot = await _fireStoreAuth.collection("clinics").get();

      if (querySnapshot.docs.isNotEmpty) {
        final querySnapshotData = querySnapshot.docs;

        for (var clinicData in querySnapshotData) {
          final clinic = clinicData.data();
          log("Clinic Found: ${clinic['name']}"); // Assuming there's a 'name' field
          dataController.allClinic.add(ClinicModel.fromMap(clinic));
        }
      } else {
        log("No clinics found.");
      }
    } catch (e) {
      log("Error fetching clinics: $e");
      // Handle error, e.g., show a message to the user
    }
  }

  Future<void> afterFetchingQrCode({required String qrCode}) async {
    log("In Database functions");
    for (var clinic in dataController.allClinic) {
      if (clinic.uid == qrCode) {
        log("Clinic Name is : ${clinic.clinicName}");

        if (dataController.sentRequestToClinicForFavourite.contains(qrCode)) {
          dataController.scannedQrCodeValue.value = '';

          final clinicModel = await getClinicByUid(qrCode);

          Get.off(() => HospitalProfileFromPatientSide(
              model: clinicModel!,
              isAdd: true,
              controller: Get.find<AddServiceProvideController>()));

          // _snackBarService.showSnackBar(
          //     message:
          //         "You already Followed  ${clinic.clinicName}, can not be added again",
          //     duration: 2,
          //     color: Colors.red,
          //     title: "Can not be added");
          return;
        }
        final clinicModel = await getClinicByUid(qrCode);

        if (clinicModel == null) return;

        Get.off(() => HospitalProfileFromPatientSide(
            model: clinicModel,
            isAdd: true,
            controller: Get.find<AddServiceProvideController>()));

        // sendRequestToClinicForFavourite(
        //     clinicModel: clinicModel,
        //     label: 'request',
        //     scannedValue: qrCode,
        //     currentUser: dataController.currentLoggedInPatient.value!);
      }
    }
  }

  Future<void> sendRequestToClinicForFavourite(
      {required ClinicModel clinicModel,
      required String label,
      String? scannedValue,
      required PatientUserModel currentUser}) async {
    switch (label) {
      case 'cancel':
        dataController.sentRequestToClinicForFavourite.remove(clinicModel.uid);

        dataController.currentLoggedInPatient.value!.followedClinics =
            dataController.sentRequestToClinicForFavourite;

        await _fireStoreAuth
            .collection('users')
            .doc(currentUser.userId)
            .update(dataController.currentLoggedInPatient.value!.toJson());
        break;

      case 'request':
        dataController.sentRequestToClinicForFavourite.add(clinicModel.uid);

        dataController.currentLoggedInPatient.value!.followedClinics =
            dataController.sentRequestToClinicForFavourite;

        _fireStoreAuth
            .collection('users')
            .doc(currentUser.userId)
            .update(dataController.currentLoggedInPatient.value!.toJson());

        if (scannedValue == null) return;

        _fireStoreAuth.collection('clinics').doc(scannedValue).update({
          'favouriteBy': FieldValue.arrayUnion([currentUser.userId]),
        });

        await Future.delayed((const Duration(seconds: 1)));

        dataController.patientFollowedClinic.add(clinicModel);

        dataController.scannedQrCodeValue.value = '';

        Get.back();
        Get.back();
        Get.back();

        break;
    }
  }

  Future<void> addClinicMember(String memberName) async {
    _fireStoreAuth
        .collection('clinics')
        .doc(dataController.currentLoggedInClinic.value!.uid)
        .update(
      {
        'teamMembers': FieldValue.arrayUnion(
          [memberName],
        ),
      },
    );
  }
}
