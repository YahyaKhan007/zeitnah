import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';

import '../../models/models.dart';
import '../controller_service/zeitnah_data_controller.dart';

class DataBaseService {
  final FirebaseFirestore _fireStoreAuth = FirebaseFirestore.instance;

  final dataController = Get.find<ZeitnahDataController>();

  // ^   Adding User to FireStore Database

  Future<bool> addPatientToFireStore({required UserModel userData}) async {
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
  Future<UserModel?> getPatientUserByUid(String uid) async {
    try {
      UserModel? userModel;

      DocumentSnapshot docSnap =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (docSnap.data() != null) {
        userModel = UserModel.fromJson(docSnap.data() as Map<String, dynamic>);
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
      {required UserModel user}) async {
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
      {required UserModel user}) async {
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
  Future<bool> deleteConnectedFirebase({required UserModel user}) async {
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
    log(dataController.currentLoggedInClinic.value!.customTimeForAppointment
        .toString());
    _fireStoreAuth
        .collection('clinics')
        .doc(dataController.currentLoggedInClinic.value!.uid)
        .update(dataController.currentLoggedInClinic.value!.toMap());
  }
}
