import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';

import '../../models/models.dart';

class DataBaseService {
  final FirebaseFirestore _fireStoreAuth = FirebaseFirestore.instance;

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
          .doc(userData.userId)
          .set(userData.toJson());

      return true;
    } catch (e, stackTrace) {
      log('Error : ${e.toString()}\n\n');
      log('stackTrace : ${stackTrace.toString()}');

      return false;
    }
  }

// ^ getting user by uid
  Future<UserModel>? getPatientUserByUid(String uid) async {
    UserModel? userModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (docSnap.data() != null) {
      userModel = UserModel.fromJson(docSnap.data() as Map<String, dynamic>);
    }

    return userModel!;
  }

  // ^ getting user by uid
  Future<ClinicModel>? getClinicByUid(String uid) async {
    ClinicModel? clinicModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("clinics").doc(uid).get();

    if (docSnap.data() != null) {
      clinicModel =
          ClinicModel.fromJson(docSnap.data() as Map<String, dynamic>);
    }

    return clinicModel!;
  }

  Future<bool> addAppointmentToFireStore(
      AppointmentModel appointmentModel) async {
    try {
      await _fireStoreAuth
          .collection("appointments")
          .doc(appointmentModel.uid)
          .set(appointmentModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
