import 'package:flutter/material.dart';
import 'package:zeitnah/views/views.dart';

import '../views/mobile_layout/client/client_homepage/add_service_provider/add_pro_views.dart';


class AppConstants {
  static final List bottomBarImages = [
    'assets/pngs/appointment.png',
    'assets/pngs/patient.png',
    'assets/pngs/setting.png'
  ];

  static final List clientBottomBarImages = [
    'assets/pngs/appointment.png',
    'assets/pngs/patient.png',
    'assets/pngs/setting.png'
  ];

  static final List bottomBarLables = ['Appointments', 'Patients', 'Settings'];
  static final List clientBottomBarLables = [
    'Appointments',
    'Add Provider',
    'My Calender'
  ];

  static final List<Widget> providerPages = [
    const Appointments(),
    const PatientScreen(),
    const ServiceProviderSettings(),
  ];
  static final List<Widget> clientPages = [
    AppointmentHome(),
    const AddProviderHome(),
    const MyCalender(),
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

  static final List<int> defaultAppointmentTime = [
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60
  ];
  static final List setPriorityTime = [
    3,
    5,
    10,
  ];

  static final srviceProviderList = [
    ProviderModel(name: "Shifa"),
    ProviderModel(
      name: "Complex",
    ),
    ProviderModel(name: "CMH"),
  ];
}

class ProviderModel {
  final String name;
  final String image;
  ProviderModel({required this.name, this.image = "assets/icons/hospital.png"});
}
