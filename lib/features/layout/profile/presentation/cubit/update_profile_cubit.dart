import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/update_profile_request.dart';
import '../../domain/use_case/get_profile_use_case.dart';
import '../../domain/use_case/update_profile_use_case.dart';
import 'update_profile_state.dart';

@lazySingleton
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileUseCase getProfileUseCase;

  UpdateProfileCubit({
    required this.updateProfileUseCase,
    required this.getProfileUseCase,
  }) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
    File? image,
  }) async {
    emit(UpdateProfileLoading());

    final result = await updateProfileUseCase(
      request: UpdateProfileRequest(name: name, email: email, image: image),
    );

    result.fold(
      (failure) {
        emit(UpdateProfileError(message: failure.message));
      },
      (response) {
        emit(UpdateProfileSuccess(response: response));
      },
    );
  }

  Future<void> getProfile() async {
    emit(UpdateProfileLoading());

    final result = await getProfileUseCase();

    result.fold(
      (failure) {
        emit(UpdateProfileError(message: failure.message));
      },
      (profile) {
        emit(GetProfileSuccess(profile: profile));
      },
    );
  }
}
