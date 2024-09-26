class PatientModel {
  final String patientId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isAccepted;

  PatientModel({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.isAccepted,
  });

  // Method to convert JSON into PatientModel
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientId: json['patientId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isAccepted: json['isAccepted'] ?? false,
    );
  }

  // Method to convert PatientModel into JSON
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'isAccepted': isAccepted,
    };
  }
}
