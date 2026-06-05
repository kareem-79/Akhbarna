import '../../../register/domain/entities/user_entity.dart';

abstract class LoginState {}

class InitState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  String massage;

  LoginError({required this.massage});
}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess({
    required this.user,
  });
}