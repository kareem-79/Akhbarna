import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/update_profile_response_model.dart';
import '../repositories/profile_repository.dart.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure, UpdateProfileResponse>> call() {
    return repository.getProfile();
  }
}
