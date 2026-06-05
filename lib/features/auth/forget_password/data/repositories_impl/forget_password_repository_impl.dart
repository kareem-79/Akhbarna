import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/forget_password_repository.dart';
import '../data_sources/remote/forget_password_remote_data_source.dart';
import '../models/OtpRequest.dart';
import '../models/OtpResponse.dart';

@Singleton(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl
    implements ForgetPasswordRepository {

  ForgetPasswordRemoteDataSource
  remoteDataSource;

  ForgetPasswordRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, OtpResponse>>
  sendOtp(
      SendOtpRequest request,
      ) async {

    try {

      final response =
      await remoteDataSource.sendOtp(
        request,
      );

      return Right(response);

    } on AppException catch (exception) {

      return Left(
        Failure(
          message: exception.message,
        ),
      );
    }
  }
}
