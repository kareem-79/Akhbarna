class UpdateProfileResponse {
  final String? message;
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final String role;
  final DateTime createdAt;

  UpdateProfileResponse({
    this.message,
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.role,
    required this.createdAt,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      message: json["message"],
      id: json["id"],
      name: json["name"],
      email: json["email"],
      profileImageUrl: json["profileImageUrl"],
      role: json["role"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}