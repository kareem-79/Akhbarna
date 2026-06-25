abstract class ForgetPasswordState {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();
}

class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading();
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;

  const ForgetPasswordSuccess({required this.message});
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;

  const ForgetPasswordError({required this.message});
}

class VerifyOtpLoading extends ForgetPasswordState {
  const VerifyOtpLoading();
}

class VerifyOtpSuccess extends ForgetPasswordState {
  final String message;

  const VerifyOtpSuccess({required this.message});
}

class VerifyOtpError extends ForgetPasswordState {
  final String message;

  const VerifyOtpError({required this.message});
}

class ResendOtpLoading extends ForgetPasswordState {
  const ResendOtpLoading();
}

class ResendOtpSuccess extends ForgetPasswordState {
  final String message;

  const ResendOtpSuccess({required this.message});
}

class ResendOtpError extends ForgetPasswordState {
  final String message;

  const ResendOtpError({required this.message});
}

class ResetPasswordLoading extends ForgetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordSuccess extends ForgetPasswordState {
  final String message;

  const ResetPasswordSuccess({required this.message});
}

class ResetPasswordError extends ForgetPasswordState {
  final String message;

  const ResetPasswordError({required this.message});
}
