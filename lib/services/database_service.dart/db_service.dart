import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zeitnah/models/appointment_model/appointment_model.dart';
import 'package:zeitnah/views/mobile_layout/client/client_homepage/add_service_provider/controller/add_service_providercontroller.dart';

import '../../models/models.dart';
import '../../views/mobile_layout/client/client_homepage/add_service_provider/add_pro_views.dart';
import '../controller_service/zeitnah_data_controller.dart';

class DataBaseService {
  final FirebaseFirestore _fireStoreAuth = FirebaseFirestore.instance;

  final dataController = Get.find<ZeitnahDataController>();

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
  Future<bool> acceptUserRequestForToSubscribe({
    required PatientUserModel user,
  }) async {
    try {
      // Move the user from the requestToSubscribe list to the favouriteClinicUserList
      dataController.requestToSubscribeClinicUserList.remove(user);
      dataController.favouriteClinicUserList.add(user);

      await _fireStoreAuth.collection('users').doc(user.userId).update({
        'requestedClinics': FieldValue.arrayRemove(
            [dataController.currentLoggedInClinic.value!.uid]),
        'followedClinics': FieldValue.arrayUnion(
            [dataController.currentLoggedInClinic.value!.uid])
      });

      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update({
        'requestForFavourite': FieldValue.arrayRemove([user.userId]),
        'favouriteBy': FieldValue.arrayUnion([user.userId])
      });

      log("User request accepted and clinic updated successfully.");
    } catch (e, stackTrace) {
      // Log error and stack trace
      log("Error occurred: $e");
      log("StackTrace: $stackTrace");
      return false;
    }

    return true;
  }

  Future<void> removeTeamMemberFromProvider({
    required String member,
  }) async {
    try {
      final clinicId = dataController.currentLoggedInClinic.value?.uid;

      if (clinicId == null) {
        log("Clinic ID not found.");
        return;
      }

      // Update Firestore to remove the member from the teamMembers array
      await _fireStoreAuth.collection('clinics').doc(clinicId).update({
        'teamMembers': FieldValue.arrayRemove([member]),
      });

      log("Team member $member removed successfully.");
    } catch (e, stackTrace) {
      // Log error and stack trace for debugging
      log("Error removing team member: $e");
      log("StackTrace: $stackTrace");
    }
  }

  // reject User Request For To Subscribe

  Future<bool> rejectUserRequestForToSubscribe({
    required PatientUserModel user,
  }) async {
    try {
      // Remove the user from the request to subscribe list
      dataController.requestToSubscribeClinicUserList.remove(user);

      // Update the clinic document in FireStore with the modified requestForFavourite list
      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update({
        'requestForFavourite': FieldValue.arrayRemove([user.userId])
      });

      await _fireStoreAuth.collection('users').doc(user.userId).update({
        'requestedClinics': FieldValue.arrayRemove(
            [dataController.currentLoggedInClinic.value!.uid])
      });

      log("User request rejected and clinic updated successfully.");
    } catch (e, stackTrace) {
      // Log error and stack trace
      log("Error occurred: $e");
      log("StackTrace: $stackTrace");
      return false;
    }

    return true;
  }

  // delete connection patient from clinic
  Future<bool> deleteConnectedPatient({required PatientUserModel user}) async {
    try {
      // Remove the user from the favourite list
      dataController.favouriteClinicUserList.remove(user);

      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update({
        'favouriteBy': FieldValue.arrayRemove([user.userId]),
      });

      await _fireStoreAuth.collection('users').doc(user.userId).update({
        'followedClinics': FieldValue.arrayRemove(
            [dataController.currentLoggedInClinic.value!.uid]),
      });
    } catch (e, stackTrace) {
      log("Error occurred: $e");
      log("StackTrace: $stackTrace");
      return false;
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

  Future<void> updatePhotoForClinic(String imageUrl) async {
    try {
      await _fireStoreAuth
          .collection('clinics')
          .doc(dataController.currentLoggedInClinic.value!.uid)
          .update({'profilePicture': imageUrl});

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
    dataController.currentLoggedInClinic.value!.teamMembers.clear();
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
    dataController.requestedClinicIds.clear();
    dataController.followedClinicIds.clear();
    try {
      log("Total followed Clinic are   :  ${dataController.currentLoggedInPatient.value!.followedClinics.length}");
      for (var workerId
          in dataController.currentLoggedInPatient.value!.followedClinics) {
        final clinicModel = await getClinicByUid(workerId);
        dataController.followedClinicIds.add(workerId);
        dataController.patientFollowedClinic.add(clinicModel!);
      }

      for (var workerId
          in dataController.currentLoggedInPatient.value!.requestedClinics) {
        final clinicModel = await getClinicByUid(workerId);
        dataController.requestedClinicIds.add(clinicModel!.uid);
      }

      log("Clinic captured  :  ${dataController.patientFollowedClinic.length}");
    } catch (e, stackTrac) {
      log("stackTrace : $stackTrac");
    }
  }

  Future<void> getAllClinics() async {
    dataController.allClinic.clear();
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

        if (dataController.requestedClinicIds.contains(qrCode)) {
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

  Future<void> sendRequestToClinicForFavourite({
    required ClinicModel clinicModel,
    required String label,
    String? scannedValue,
    required PatientUserModel currentUser,
  }) async {
    try {
      switch (label) {
        case 'cancel':
          log('cancel called');
          dataController.requestedClinicIds.remove(clinicModel.uid);

          _fireStoreAuth.collection('users').doc(currentUser.userId).update({
            'requestedClinics': FieldValue.arrayRemove([clinicModel.uid])
          });

          await _fireStoreAuth
              .collection('clinics')
              .doc(clinicModel.uid)
              .update({
            'requestForFavourite': FieldValue.arrayRemove([currentUser.userId])
          });

          break;

        case 'request':
          log('request called');

          dataController.requestedClinicIds.add(clinicModel.uid);

          _fireStoreAuth.collection('users').doc(currentUser.userId).update({
            'requestedClinics': FieldValue.arrayUnion([clinicModel.uid])
          });

          await _fireStoreAuth
              .collection('clinics')
              .doc(clinicModel.uid)
              .update({
            'requestForFavourite': FieldValue.arrayUnion([currentUser.userId])
          });

          break;
      }
    } catch (e, stackTrace) {
      log("Error occurred: $e");
      log("StackTrace: $stackTrace");
    }
  }

  Future<void> addClinicMember(String memberName) async {
    try {
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
    } catch (e, stackTrace) {
      log('stackTrace : $stackTrace');
    }
  }

//   getting appointment data for a patient
  Future<void> getAppointmentDataForPatient() async {
    dataController.acceptedAppointmentForPatient.clear();
    dataController.openAppointmentForPatient.clear();
    final appointmentData =
        await _fireStoreAuth.collection('appointments').get();

    final data = appointmentData.docs;

    for (var doc in data) {
      final appointmentDoc = AppointmentModel.fromJson(doc.data());

      // checking if the clinic if followed by the user or not
      if (!dataController.currentLoggedInPatient.value!.followedClinics
          .contains(appointmentDoc.clinicId)) continue;

      // checking if the appointment is accepted by any other user or not

      if (appointmentDoc.acceptedBy !=
              dataController.currentLoggedInPatient.value!.userId &&
          appointmentDoc.acceptedBy!.isNotEmpty) continue;

      // if it is not accepted by current patient then it is accepted

      if (appointmentDoc.acceptedBy ==
          dataController.currentLoggedInPatient.value!.userId) {
        dataController.acceptedAppointmentForPatient.add(appointmentDoc);
      }

      if (appointmentDoc.cancelBy!
          .contains(dataController.currentLoggedInPatient.value!.userId)) {
        continue;
      }

      // if it is not accepted by anyOne then it is open
      if (appointmentDoc.acceptedBy!.isEmpty) {
        dataController.openAppointmentForPatient.add(appointmentDoc);
      }
    }
  }

  Future<void> deleteProviderFromPatient({required ClinicModel clinic}) async {
    try {
      // Remove the clinic from the patient's followed list in the data controller
      dataController.patientFollowedClinic.remove(clinic);
      dataController.followedClinicIds.remove(clinic.uid);

      // Update the user's followed clinics in FireStore
      await _fireStoreAuth
          .collection('users')
          .doc(dataController.currentLoggedInPatient.value!.userId)
          .update({
        'followedClinics': FieldValue.arrayRemove([clinic.uid])
      });

      // Remove the patient from the clinic's favouriteBy list and update FireStore
      await _fireStoreAuth.collection('clinics').doc(clinic.uid).update({
        'favouriteBy': FieldValue.arrayRemove(
            [dataController.currentLoggedInPatient.value!.userId])
      });

      log("Successfully removed clinic from user's followed clinics and user from clinic's favourite list.");
    } catch (e, stackTrace) {
      log("Error occurred: $e");
      log("StackTrace: $stackTrace");
    }
  }
}
