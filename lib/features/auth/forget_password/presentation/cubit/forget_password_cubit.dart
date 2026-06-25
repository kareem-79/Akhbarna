import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/OtpRequest.dart';
import '../../data/models/ResetPasswordRequest.dart';
import '../../data/models/VerifyOtpRequest.dart';
import '../../domain/use_case/reset_password_use_case.dart';
import '../../domain/use_case/send_otp_use_case.dart';
import '../../domain/use_case/verify_otp_use_case.dart';
import 'state/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordCubit({
    required this.resetPasswordUseCase,
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(const ForgetPasswordInitial());

  Future<void> sendOtp(String email) async {
    emit(const ForgetPasswordLoading());

    final result = await sendOtpUseCase(SendOtpRequest(email: email));

    result.fold(
      (failure) {
        emit(ForgetPasswordError(message: failure.message));
      },
      (response) {
        emit(ForgetPasswordSuccess(message: response.message));
      },
    );
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(VerifyOtpLoading());

    final result = await verifyOtpUseCase(
      VerifyOtpRequest(email: email, otp: otp),
    );

    result.fold(
      (failure) {
        emit(VerifyOtpError(message: failure.message));
      },
      (response) {
        emit(VerifyOtpSuccess(message: response.message));
      },
    );
  }

  Future<void> resendOtp(String email) async {
    emit(const ResendOtpLoading());

    final result = await sendOtpUseCase(SendOtpRequest(email: email));

    result.fold(
      (failure) => emit(ResendOtpError(message: failure.message)),
      (response) => emit(ResendOtpSuccess(message: response.message)),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(const ResetPasswordLoading());

    final result = await resetPasswordUseCase(
      ResetPasswordRequest(email: email, otp: otp, newPassword: newPassword),
    );

    result.fold(
      (failure) {
        emit(ResetPasswordError(message: failure.message));
      },
      (response) {
        emit(ResetPasswordSuccess(message: response.message));
      },
    );
  }
}
