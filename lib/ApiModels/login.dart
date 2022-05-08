class login {
  late final int error;
  late final String message;

  login.fromJson(Map<String, dynamic> json) {
    error = json['error'] ?? 0;
    message = json['message'] ?? '';
  }
}
