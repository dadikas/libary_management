class SignupReqParams {
  final String email;
  final String password;
  final String name;

  SignupReqParams({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}