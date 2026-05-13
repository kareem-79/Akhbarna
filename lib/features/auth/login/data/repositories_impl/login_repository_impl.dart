import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginResponse.dart';
import 'package:akhbarna/features/auth/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginApiRemoteDataSource;

  LoginRepositoryImpl({required this.loginApiRemoteDataSource});

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return loginApiRemoteDataSource.login(request);
  }
}
