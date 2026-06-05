abstract class ForgetPasswordState {}

class ForgetPasswordInitial
    extends ForgetPasswordState {}

class ForgetPasswordLoading
    extends ForgetPasswordState {}

class ForgetPasswordSuccess
    extends ForgetPasswordState {

  String message;

  ForgetPasswordSuccess({
    required this.message,
  });
}

class ForgetPasswordError
    extends ForgetPasswordState {

  String message;

  ForgetPasswordError({
    required this.message,
  });
}