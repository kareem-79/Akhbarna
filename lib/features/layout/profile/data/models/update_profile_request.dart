import 'dart:io';

class UpdateProfileRequest {
  final String name;
  final String email;
  final File? image;

  UpdateProfileRequest({required this.name, required this.email, this.image});
}
