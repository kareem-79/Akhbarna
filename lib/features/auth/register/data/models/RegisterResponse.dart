class RegisterResponse {
  final String message;
  final String userId;

  RegisterResponse({required this.message, required this.userId});

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(message: json["message"], userId: json["userId"]);
  }
}
