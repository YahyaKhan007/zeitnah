import 'package:flutter/material.dart';
import 'package:zeitnah/views/views.dart';

class AppConstants {
  static final List bottomBarImages = [
    'assets/icons/calender.png',
    'assets/icons/calender.png',
    'assets/icons/calender.png'
  ];

  static final List bottomBarLables = ['Appointments', 'Patients', 'Settings'];

  static final List<Widget> providerPages = [
    const Appointments(),
    const PatientScreen(),
    const ServiceProviderSettings(),
    
  ];

  static final List<Widget> appointmentPages = [
    const CreateAppointments(),
    const OpenAppointments(),
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
    'meesum',
    'Talha',
    'Asfar',
    'Yahya',
    'Usama',
    'meesum',
    'Talha',
    'Asfar'
  ];
}
