import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/OtpRequest.dart';
import '../../domain/use_case/send_otp_use_case.dart';
import 'forget_password_state.dart';
@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  SendOtpUseCase sendOtpUseCase;

  ForgetPasswordCubit({required this.sendOtpUseCase})
    : super(ForgetPasswordInitial());

  Future<void> sendOtp(String email) async {
    emit(ForgetPasswordLoading());

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
}
