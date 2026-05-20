import 'package:akhbarna/features/auth/register/presentation/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/RegisterRequest.dart';
import '../../domain/use_case/register_use_case.dart';
@singleton
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(InitState());

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await registerUseCase.call(request);
    result.fold(
      (failure) {
        emit(RegisterError(massage: failure.message));
      },
      (user) {
        emit(RegisterSuccess());
      },
    );
  }
}
