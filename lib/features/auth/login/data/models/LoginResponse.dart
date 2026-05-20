import '../../../register/domain/entities/user_entity.dart';

class LoginResponse {
  final String message;
  final String id;
  final String name;
  final String email;
  final dynamic profileImageUrl;
  final String token;

  const LoginResponse({
    required this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.token,
  });

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
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