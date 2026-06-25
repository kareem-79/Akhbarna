import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/forget_password_repository.dart';
import '../data_sources/remote/forget_password_remote_data_source.dart';
import '../models/OtpRequest.dart';
import '../models/OtpResponse.dart';
import '../models/ResetPasswordRequest.dart';
import '../models/ResetPasswordResponse.dart';
import '../models/VerifyOtpRequest.dart';
import '../models/VerifyOtpResponse.dart';

@Singleton(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, OtpResponse>> sendOtp(SendOtpRequest request) async {
    try {
      final response = await remoteDataSource.sendOtp(request);

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (_) {
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    try {
      final response = await remoteDataSource.verifyOtp(request);
      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (_) {
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await remoteDataSource.resetPassword(request);

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (_) {
      return Left(Failure(message: "Something went wrong"));
    }
  }
}
