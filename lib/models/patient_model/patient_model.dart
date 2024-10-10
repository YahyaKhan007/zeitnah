class PatientModel {
  final String patientId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isAccepted;
  List<String> followedClinics;

  PatientModel({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.isAccepted,
    required this.followedClinics,
  });

  // Factory method to create an instance of PatientModel from JSON
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientId: json['patientId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isAccepted: json['isAccepted'] as bool,
      followedClinics: List<String>.from(json['followedClinics']),
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'isAccepted': isAccepted,
      'followedClinics': followedClinics,
    };
  }

  // CopyWith method to create a new instance with some fields changed
  PatientModel copyWith({
    String? patientId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    bool? isAccepted,
    List<String>? followedClinics,
  }) {
    return PatientModel(
      patientId: patientId ?? this.patientId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAccepted: isAccepted ?? this.isAccepted,
      followedClinics: followedClinics ?? this.followedClinics,
    );
  }

  @override
  String toString() {
    return 'PatientModel(patientId: $patientId, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, isAccepted: $isAccepted, followedClinics: $followedClinics)';
  }

  // Equality operator and hashcode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PatientModel) return false;
    return other.patientId == patientId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.isAccepted == isAccepted &&
        other.followedClinics == followedClinics;
  }

  @override
  int get hashCode {
    return patientId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        isAccepted.hashCode ^
        followedClinics.hashCode;
  }
}
