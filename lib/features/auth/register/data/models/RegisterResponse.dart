import '../../domain/entities/user_entity.dart';

class RegisterResponse {
  final String message;
  final String id;
  final String name;
  final String email;
  final dynamic profileImageUrl;
  final String token;

  RegisterResponse({
    required this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.token,
  });

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(
      message: json['message'] ?? "",
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      profileImageUrl: json['profileImageUrl'],
      token: json['token'] ?? "",
    );
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}
