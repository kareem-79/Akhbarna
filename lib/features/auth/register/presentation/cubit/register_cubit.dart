import 'package:akhbarna/features/auth/register/domain/repositories/register_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/RegisterRequest.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepository registerRepository;

  RegisterCubit({required this.registerRepository}) : super(InitState());

  void register(RegisterRequest request) async {
    try {
      emit(RegisterLoading());
      var response = await registerRepository.register(request);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(massage: e.toString()));
    }
  }
}

abstract class RegisterState {}

class InitState extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  String massage;

  RegisterError({required this.massage});
}

class RegisterSuccess extends RegisterState {}
