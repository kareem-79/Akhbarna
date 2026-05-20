abstract class RegisterState {}

class InitState extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  String massage;

  RegisterError({required this.massage});
}

class RegisterSuccess extends RegisterState {}