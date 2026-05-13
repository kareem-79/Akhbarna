class LoginResponse {
  const LoginResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.token,});

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(id: json['id'],
        name: json['name'],
        email: json['email'],
        profileImageUrl: json['profileImageUrl'],
        token: json['token']);
  }

  final String id;
  final String name;
  final String email;
  final dynamic profileImageUrl;
  final String token;


}