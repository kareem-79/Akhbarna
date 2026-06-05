import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(InitState());

  void login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await loginUseCase.call(request);
    result.fold(
      (failure) {
        emit(LoginError(massage: failure.message));
      },
      (user) {
        emit(LoginSuccess(user: user));
      },
    );
  }
}
