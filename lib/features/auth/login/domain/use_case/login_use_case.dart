import 'package:akhbarna/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../register/domain/entities/user_entity.dart';
import '../../data/models/LoginRequest.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, UserEntity>> call(LoginRequest request) {
    return loginRepository.login(request);
  }
}
