import '../../models/change_password_request.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<void> changePassword({
    required ChangePasswordRequest request,
  });
}