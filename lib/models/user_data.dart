class UserData {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? profilePicture;

  UserData({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["full_name"],
    fullName: json["email"],
    email: json["password"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
  );
}

class UserDataError {
  final dynamic error;

  const UserDataError(this.error);
}
