import 'package:akhbarna/features/auth/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/RegisterRequest.dart';
import '../entities/user_entity.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<Either<Failure, UserEntity>> call(RegisterRequest request) {
    return registerRepository.register(request);
  }
}
