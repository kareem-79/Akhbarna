import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/change_password_request.dart';
import '../repositories/change_password_repository.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<Either<Failure, void>> call({required ChangePasswordRequest request}) {
    return repository.changePassword(request: request);
  }
}
