import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/domain/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(InitState());

  void login(LoginRequest request) async {
    try {
      emit(LoginLoading());
      var response = await loginRepository.login(request);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(massage: e.toString()));
    }
  }
}

abstract class LoginState {}

class InitState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  String massage;

  LoginError({required this.massage});
}

class LoginSuccess extends LoginState {}
