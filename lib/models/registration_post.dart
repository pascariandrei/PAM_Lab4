class Registration {
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? profilePicture;

  Registration({
    required this.fullName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.profilePicture,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        profilePicture: json["profile_picture"],
      );
}

class RegistrationError {
  final dynamic error;

  const RegistrationError(this.error);
}
