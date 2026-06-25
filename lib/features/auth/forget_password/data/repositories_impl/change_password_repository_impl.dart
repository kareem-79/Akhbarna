import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/change_password_repository.dart';
import '../data_sources/remote/change_password_remote_data_source.dart';
import '../models/change_password_request.dart';

@Singleton(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    try {
      await remoteDataSource.changePassword(request: request);

      return const Right(null);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
