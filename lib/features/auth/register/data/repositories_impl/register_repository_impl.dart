import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_remote_data_source.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterRequest.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterResponse.dart';
import 'package:akhbarna/features/auth/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerApiRemoteDataSource;

  RegisterRepositoryImpl({required this.registerApiRemoteDataSource});

  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return registerApiRemoteDataSource.register(request);
  }
}
