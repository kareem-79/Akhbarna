import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/change_password_request.dart';
import '../../domain/use_case/change_password_use_case.dart';
import 'state/change_password_state.dart';

@lazySingleton
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({required this.changePasswordUseCase})
    : super(ChangePasswordInitial());
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    final result = await changePasswordUseCase(
      request: ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );

    result.fold(
      (failure) {
        emit(ChangePasswordError(message: failure.message));
      },
      (_) {
        emit(ChangePasswordSuccess());
      },
    );
  }
}
