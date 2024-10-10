class ClinicModel {
  String address;
  String clinicName;
  final String email;
  bool isPriority;
  bool isVerified;
  String phoneNumber;
  String profilePicture;
  final String uid;
  List<String> favouriteBy;
  List<String> teamMembers;
  List<String> requestForFavourite;
  int totalAcceptedAppointments;
  final String userRole;
  int customTimeForAppointment;

  ClinicModel({
    required this.address,
    required this.clinicName,
    required this.email,
    required this.totalAcceptedAppointments,
    required this.isPriority,
    required this.isVerified,
    required this.phoneNumber,
    required this.profilePicture,
    required this.uid,
    required this.favouriteBy,
    required this.teamMembers,
    required this.requestForFavourite,
    required this.userRole,
    required this.customTimeForAppointment,
  });

  // Factory constructor to create a ClinicModel from a Map (like Firestore data)
  factory ClinicModel.fromMap(Map<String, dynamic> map) {
    return ClinicModel(
      address: map['address'] ?? '',
      totalAcceptedAppointments: map['totalAcceptedAppointments'] ?? '',
      customTimeForAppointment: map['customTimeForAppointment'] ?? '',
      clinicName: map['clinicName'] ?? '',
      email: map['email'] ?? '',
      isPriority: map['isPriority'] ?? false,
      isVerified: map['isVerified'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      uid: map['uid'] ?? '',
      favouriteBy: List<String>.from(map['favouriteBy'] ?? []),
      teamMembers: List<String>.from(map['teamMembers'] ?? []),
      requestForFavourite: List<String>.from(map['requestForFavourite'] ?? []),
      userRole: map['userRole'] ?? '',
    );
  }

  // Method to convert a ClinicModel to a Map (for FireStore or other storage)
  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'clinicName': clinicName,
      'customTimeForAppointment': customTimeForAppointment,
      'email': email,
      'totalAcceptedAppointments': totalAcceptedAppointments,
      'isPriority': isPriority,
      'isVerified': isVerified,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'uid': uid,
      'favouriteBy': favouriteBy,
      'teamMembers': teamMembers,
      'requestForFavourite': requestForFavourite,
      'userRole': userRole,
    };
  }
}
