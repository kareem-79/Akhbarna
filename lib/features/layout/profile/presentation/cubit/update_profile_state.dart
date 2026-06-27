import '../../data/models/update_profile_response_model.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse response;

  UpdateProfileSuccess({required this.response});
}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  UpdateProfileError({required this.message});
}

class GetProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse profile;

  GetProfileSuccess({required this.profile});
}
