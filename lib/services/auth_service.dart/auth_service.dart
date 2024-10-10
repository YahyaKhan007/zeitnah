import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/controller_service/zeitnah_data_controller.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';

import '../../models/models.dart';
import '../database_service.dart/db_service.dart';
import '../snackbar_service/snackbar_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataBaseService _dbService = DataBaseService();
  final SnackBarService _snackBarService = SnackBarService();
  final dataController = Get.find<ZeitnahDataController>();

  final currentUser = FirebaseAuth.instance.currentUser;

  Future<
      ({
        bool isSuccess,
        PatientUserModel? userModel,
        ClinicModel? clinicModel
      })> signupUserWithEmailPassword({
    required String userEmail,
    required String userRole,
    required String userPassword,
    required String confirmPassword,
    required String firstName,
    required String? lastName,
    required bool isPriority,
    required String? phoneNumber,
    required String profilePicture,
  }) async {
    // Validate input
    if (userEmail.isEmpty ||
        userPassword.isEmpty ||
        userPassword != confirmPassword) {
      _showErrorSnackBar(
        message: 'Please Enter Correct Credentials',
        title: "Invalid Input",
      );
      return (isSuccess: false, userModel: null, clinicModel: null);
    }

    try {
      // Create User with Firebase
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      User? user = userCredential.user;
      if (user == null) {
        _showErrorSnackBar(
          message: 'Failed to create user. Try again.',
          title: 'Signup Failed',
        );
        return (isSuccess: false, userModel: null, clinicModel: null);
      }

      // Create UserModel based on role
      late PatientUserModel newUserModel;
      switch (userRole) {
        case 'patient':
          newUserModel = _createUserModel(
            profilePicture: '',
            user: user,
            userRole: 'Patient',
            firstName: firstName,
            lastName: lastName!,
            phoneNumber: phoneNumber!,
            isPriority: isPriority,
          );
          bool dbResult =
              await _dbService.addPatientToFireStore(userData: newUserModel);
          if (!dbResult) {
            _showErrorSnackBar(
              message: 'Failed to save user data to FireStore',
              title: 'Database Error',
            );
            return (isSuccess: false, userModel: null, clinicModel: null);
          }

          _showSuccessSnackBar(
            message: "Signup Successful",
            title: 'Success',
          );

          return (isSuccess: true, userModel: newUserModel, clinicModel: null);

        case 'clinic':
          late ClinicModel clinicModel;
          clinicModel = _createClinicModel(
            user: user,
            address: "",
            clinicName: firstName,
            email: userEmail.toLowerCase(),
            isPriority: isPriority,
            isVerified: false,
            phoneNumber: "",
            profilePicture: profilePicture,
            userId: "",
            userRole: userRole,
          );

          bool dbResult =
              await _dbService.addClinicToFireStore(userData: clinicModel);
          if (!dbResult) {
            _showErrorSnackBar(
              message: 'Failed to save user data to FireStore',
              title: 'Database Error',
            );
          }

          _showSuccessSnackBar(
              message: "Welcome Onboard $userEmail", title: "Account created");
          return (isSuccess: true, userModel: null, clinicModel: clinicModel);

        default:
          _showErrorSnackBar(
            message: 'Invalid user role provided',
            title: 'Signup Failed',
          );
          return (isSuccess: false, userModel: null, clinicModel: null);
      }

      // Add user to FireStore
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar(
        message: e.message ?? 'Firebase Authentication Error',
        title: 'Signup Failed',
      );
      return (isSuccess: false, userModel: null, clinicModel: null);
    } catch (e, stackTrace) {
      log('Error: $e');
      log('StackTrace: $stackTrace');
      return (isSuccess: false, userModel: null, clinicModel: null);
    }
  }

  //  Login User

  Future<
      ({
        bool isSuccess,
        PatientUserModel? userModel,
        ClinicModel? clinicModel
      })> loginUser({
    required String email,
    required String password,
    required String from,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return (isSuccess: false, userModel: null, clinicModel: null);
    }

    try {
      final userCredentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredentials.user;

      if (user == null) {
        log("user is null");
        return (isSuccess: false, userModel: null, clinicModel: null);
      }
      switch (from) {
        case 'mobile_view':
          final loggedUserModel =
              await _dbService.getPatientUserByUid(user.uid);
          final loggedClinicModel = await _dbService.getClinicByUid(user.uid);

          dataController.currentLoggedInClinic.value = loggedClinicModel;
          dataController.currentLoggedInPatient.value = loggedUserModel;

          return (
            isSuccess: true,
            userModel: loggedUserModel,
            clinicModel: loggedClinicModel
          );

        case 'clinic':
          final loggedClinicModel = await _dbService.getClinicByUid(user.uid);

          _showSuccessSnackBar(
              message:
                  "Welcome Onboard ${loggedClinicModel?.clinicName.toString()}",
              title: "Login Successful");
          return (
            isSuccess: true,
            userModel: null,
            clinicModel: loggedClinicModel
          );
      }
    } catch (e, stackTrace) {
      _showErrorSnackBar(
          message: "Please check your email and password, then try again",
          title: "Email Password not matched");
      log("stackTrace : $stackTrace");
    }

    return (isSuccess: false, userModel: null, clinicModel: null);
  }

  // Forget Password

  Future<bool> forgetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
    _showSuccessSnackBar(
        message:
            "You can restore your password from the e-mail we have sent to $email",
        title: "Reset Link Sent");
    return true;
  }

  // Helper function to create UserModel based on role

  PatientUserModel _createUserModel(
      {required User user,
      required String userRole,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required bool isPriority,
      required String profilePicture}) {
    return PatientUserModel(
      followedClinics: [],
      email: user.email ?? '',
      firstName: firstName,
      lastName: lastName,
      isPriority: isPriority,
      phoneNumber: phoneNumber,
      profilePicture: profilePicture,
      userId: user.uid,
      userRole: userRole,
    );
  }

  ClinicModel _createClinicModel({
    required User user,
    required String address,
    required String clinicName,
    required String email,
    required String phoneNumber,
    required String profilePicture,
    required String userId,
    required String userRole,
    required bool isVerified,
    required bool isPriority,
  }) {
    return ClinicModel(
        teamMembers: [],
        address: address,
        clinicName: clinicName,
        email: user.email ?? '',
        customTimeForAppointment: 20,
        isPriority: isPriority,
        isVerified: isVerified,
        phoneNumber: phoneNumber,
        profilePicture: profilePicture,
        favouriteBy: [],
        requestForFavourite: [],
        uid: user.uid,
        userRole: userRole,
        totalAcceptedAppointments: 0);
  }

  // checking for isUserLogIn

  ({bool isSuccess, String userUid}) isUserLogin() {
    if (_auth.currentUser == null) {
      return (isSuccess: false, userUid: '');
    } else {
      final userUid = _auth.currentUser!.uid;
      return (isSuccess: true, userUid: userUid);
    }
  }

  Future<ClinicModel?> isClinic({required String userUid}) async {
    try {
      final loggedProviderModel = await _dbService.getClinicByUid(userUid);

      dataController.currentLoggedInClinic.value = loggedProviderModel;

      return loggedProviderModel;
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
    }

    return null;
  }

  Future<PatientUserModel?> isPatient({required String userUid}) async {
    try {
      final loggedUserModel = await _dbService.getPatientUserByUid(userUid);

      dataController.currentLoggedInPatient.value = loggedUserModel;

      return loggedUserModel;
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
    }

    return null;
  }

  // Logout User
  logoutUser() async {
    await _auth.signOut();
    Get.offAllNamed(RouterHelperService.login);
  }

  // Centralized Snack bar Error Display
  void _showErrorSnackBar({required String message, required String title}) {
    _snackBarService.showSnackBar(
      message: message,
      duration: 2,
      color: Colors.red,
      title: title,
    );
  }

  void _showSuccessSnackBar({required String message, required String title}) {
    _snackBarService.showSnackBar(
      message: message,
      duration: 2,
      color: Colors.green,
      title: title,
    );
  }
}
