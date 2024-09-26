class UserModel {
  final String email;
  final String firstName;
  final bool isPriority;
  // final bool isVerified;
  final String lastName;
  final String phoneNumber;
  final String profilePicture;
  final String userId;
  final String userRole;

  UserModel({
    required this.email,
    required this.firstName,
    required this.isPriority,
    // required this.isVerified,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.userId,
    required this.userRole,
  });

  // Method to convert JSON into UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      isPriority: json['isPriority'] ?? false,
      // isVerified: json['isVerified'] ?? false,
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      userId: json['userId'] ?? '',
      userRole: json['userRole'] ?? '',
    );
  }

  // Method to convert UserModel into JSON
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
    };
  }
}
