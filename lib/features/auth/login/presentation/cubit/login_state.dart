abstract class LoginState {}

class InitState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  String massage;

  LoginError({required this.massage});
}

class LoginSuccess extends LoginState {}