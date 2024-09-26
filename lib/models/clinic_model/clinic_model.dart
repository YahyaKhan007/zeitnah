class ClinicModel {
  final String address;
  final String clinicName;
  final String email;

  final bool isPriority;
  final bool isVerified;

  final String phoneNumber;
  final String profilePicture;
  final String userId;
  final String userRole;

  ClinicModel({
    required this.address,
    required this.clinicName,
    required this.email,
    required this.isPriority,
    required this.isVerified,
    required this.phoneNumber,
    required this.profilePicture,
    required this.userId,
    required this.userRole,
  });

  // Method to convert JSON into UserModel
  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      address: json['address'] ?? '',
      clinicName: json['clinicName'] ?? '',
      email: json['email'] ?? '',
      isPriority: json['isPriority'] ?? false,
      isVerified: json['isVerified'] ?? false,
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      userId: json['userId'] ?? '',
      userRole: json['userRole'] ?? '',
    );
  }

  // Method to convert UserModel into JSON
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'clinicName': clinicName,
      'email': email,
      'isPriority': isPriority,
      'isVerified': isVerified,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'userId': userId,
      'userRole': userRole,
    };
  }
}
