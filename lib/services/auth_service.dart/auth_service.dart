import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah/services/router_service/router_helper_service.dart';

import '../../models/models.dart';
import '../database_service.dart/db_service.dart';
import '../snackbar_service/snackbar_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataBaseService _dbService = DataBaseService();
  final SnackBarService _snackBarService = SnackBarService();

  Future<({bool isSuccess, UserModel? userModel})> signupUserWithEmailPassword({
    required String userEmail,
    required String userRole,
    required String userPassword,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required bool isPriority,
    required String phoneNumber,
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
      return (isSuccess: false, userModel: null);
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
        return (isSuccess: false, userModel: null);
      }

      // Create UserModel based on role
      late UserModel newUserModel;
      switch (userRole) {
        case 'patient':
          newUserModel = _createUserModel(
            profilePicture: '',
            user: user,
            userRole: 'Patient',
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            isPriority: isPriority,
          );
          break;

        case 'provider':
          break;

        default:
          _showErrorSnackBar(
            message: 'Invalid user role provided',
            title: 'Signup Failed',
          );
          return (isSuccess: false, userModel: null);
      }

      // Add user to Firestore
      bool dbResult =
          await _dbService.addUserToFireStore(userData: newUserModel);
      if (!dbResult) {
        _showErrorSnackBar(
          message: 'Failed to save user data to Firestore',
          title: 'Database Error',
        );
        return (isSuccess: false, userModel: null);
      }

      _snackBarService.showSnackbar(
        message: "Signup Successful",
        duration: 3,
        color: Colors.black,
        title: 'Success',
      );

      return (isSuccess: true, userModel: newUserModel);
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar(
        message: e.message ?? 'Firebase Authentication Error',
        title: 'Signup Failed',
      );
      return (isSuccess: false, userModel: null);
    } catch (e, stackTrace) {
      log('Error: $e');
      log('StackTrace: $stackTrace');
      return (isSuccess: false, userModel: null);
    }
  }

  //  Login User

  Future<({bool isSuccess, UserModel? userModel})> loginUser(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return (isSuccess: false, userModel: null);
    }

    try {
      final userCredentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredentials.user;

      if (user == null) {
        log("user is null");
        return (isSuccess: false, userModel: null);
      }

      final loggedUserModel = await _dbService.getUserByUid(user.uid);

      return (isSuccess: true, userModel: loggedUserModel);
    } catch (e, stackTrace) {
      _showErrorSnackBar(
          message: "Please check your email and password, then try again",
          title: "Email Password not matched");
      log("stackTrace : $stackTrace");
    }

    return (isSuccess: false, userModel: null);
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

  UserModel _createUserModel(
      {required User user,
      required String userRole,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required bool isPriority,
      required String profilePicture}) {
    return UserModel(
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

  // checking for isUserLogIn

  Future<({bool isSuccess, UserModel? userModel})> isUserLogin() async {
    if (_auth.currentUser == null) return (isSuccess: false, userModel: null);

    try {
      final userUid = _auth.currentUser!.uid;
      final loggedUserModel = await _dbService.getUserByUid(userUid);

      return (isSuccess: true, userModel: loggedUserModel);
    } catch (e, stackTrace) {
      log("stackTrace : $stackTrace");
    }

    return (isSuccess: false, userModel: null);
  }

  // Logout User
  logoutUser() async {
    await _auth.signOut();
    Get.offAllNamed(RouterHelperService.login);
  }

  // Centralized Snackbar Error Display
  void _showErrorSnackBar({required String message, required String title}) {
    _snackBarService.showSnackbar(
      message: message,
      duration: 2,
      color: Colors.red,
      title: title,
    );
  }

  void _showSuccessSnackBar({required String message, required String title}) {
    _snackBarService.showSnackbar(
      message: message,
      duration: 2,
      color: Colors.green,
      title: title,
    );
  }
}
