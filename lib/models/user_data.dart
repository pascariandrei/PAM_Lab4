class UserData {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? profilePicture;

  UserData({
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    fullName: json["full_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
  );
}

class UserDataError {
  final dynamic error;

  const UserDataError(this.error);
}
