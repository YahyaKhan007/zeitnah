class PatientUserModel {
  final String email;
  final String firstName;
  final bool isPriority;
  // final bool isVerified;
  final String lastName;
  final String phoneNumber;
  List<String> followedClinics;
  List<String> requestedClinics;
  final String profilePicture;
  final String userId;
  final String userRole;

  PatientUserModel({
    required this.email,
    required this.firstName,
    required this.isPriority,
    // required this.isVerified,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.userId,
    required this.userRole,
    required this.followedClinics,
    required this.requestedClinics,
  });

  // Factory method to create an instance of PatientUserModel from JSON
  factory PatientUserModel.fromJson(Map<String, dynamic> json) {
    return PatientUserModel(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      isPriority: json['isPriority'] as bool,
      // isVerified: json['isVerified'] as bool,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String,
      userId: json['userId'] as String,
      userRole: json['userRole'] as String,
      followedClinics: List<String>.from(json['followedClinics'] ?? []),
      requestedClinics: List<String>.from(json['requestedClinics'] ?? []),
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'isPriority': isPriority,
      // 'isVerified': isVerified,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'userId': userId,
      'userRole': userRole,
      'followedClinics': followedClinics,
      'requestedClinics': requestedClinics,
    };
  }

  // CopyWith method to create a new instance with some fields changed
  PatientUserModel copyWith({
    String? email,
    String? firstName,
    bool? isPriority,
    // bool? isVerified,
    String? lastName,
    String? phoneNumber,
    String? profilePicture,
    String? userId,
    String? userRole,
    List<String>? followedClinics,
    List<String>? requestedClinics,
  }) {
    return PatientUserModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      isPriority: isPriority ?? this.isPriority,
      // isVerified: isVerified ?? this.isVerified,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      userId: userId ?? this.userId,
      userRole: userRole ?? this.userRole,
      followedClinics: followedClinics ?? this.followedClinics,
      requestedClinics: requestedClinics ?? this.requestedClinics,
    );
  }

  @override
  String toString() {
    return 'PatientUserModel(email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, isPriority: $isPriority, profilePicture: $profilePicture, userId: $userId, userRole: $userRole, followedClinics: $followedClinics, requestedClinics: $requestedClinics)';
  }

  // Equality operator and hashCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PatientUserModel) return false;
    return other.email == email &&
        other.firstName == firstName &&
        other.isPriority == isPriority &&
        // other.isVerified == isVerified &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.profilePicture == profilePicture &&
        other.userId == userId &&
        other.userRole == userRole &&
        other.followedClinics == followedClinics &&
        other.requestedClinics == requestedClinics;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        firstName.hashCode ^
        isPriority.hashCode ^
        // isVerified.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        profilePicture.hashCode ^
        userId.hashCode ^
        userRole.hashCode ^
        followedClinics.hashCode ^
        requestedClinics.hashCode;
  }
}
