import 'package:flutter/material.dart';
import 'package:zeitnah/views/views.dart';

class AppConstants {
  static final List bottomBarImages = [
    'assets/icons/calender.png',
    'assets/icons/patient.png',
    'assets/icons/setting.png'
  ];

  static final List clientBottomBarImages = [
    'assets/icons/calender.png',
    'assets/icons/patient.png',
    'assets/icons/setting.png'
  ];

  static final List bottomBarLables = ['Appointments', 'Patients', 'Settings'];
  static final List clientBottomBarLables = [
    'Messages',
    'add Service Provider',
    'My Calender'
  ];

  static final List<Widget> providerPages = [
    const Appointments(),
    const PatientScreen(),
    const ServiceProviderSettings(),
  ];
  static final List<Widget> clientPages = [
    AppointmentHome(),
    const ServiceProviderSettings(),
    const MyCalender(),
  ];

  static final List<Widget> appointmentPages = [
    const CreateAppointments(),
    const OpenClientAppointments(),
    const AcceptedAppointments()
  ];

  static final List<String> workersList = [
    'Yahya',
    'Usama',
    'meesum',
    'Talha',
    'Asfar',
    'Yahya',
    'Usama',
    'meesum',
    'Talha',
    'Asfar',
    'Yahya',
    'Usama',
  ];

  static final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesnday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  static final List<int> defaultAppointmentTime = [10, 20, 30, 40, 50];
}
