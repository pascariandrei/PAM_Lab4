class Login {
  final String? access;
  final String? refresh;

  Login({
    required this.access,
    required this.refresh,
  });


  factory Login.fromJson(Map<String, dynamic> json) => Login(
    access:json["access"],
    refresh:json["refresh"],

  );
}

class LoginError {
  final dynamic error;

  const LoginError(this.error);
}
