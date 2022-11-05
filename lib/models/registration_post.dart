class Registration {
  final String fullName;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? profilePicture;

  Registration({
    required this.fullName,
    required this.email,
    required this.password,
     this.phoneNumber,
      this.profilePicture,
  });

  Map<String, dynamic>  toJson() =>
      {
        "full_name": fullName,
        "email": email,
        "password": password,
        "phone_number":phoneNumber,
        "profile_picture":profilePicture,
      };

}