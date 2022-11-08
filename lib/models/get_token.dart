class Token {
  final String refresh;
  final String acces;

  Token({
    required this.refresh,
    required this.acces,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        acces: json["access"],
      );
}
