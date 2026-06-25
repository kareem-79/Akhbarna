import '../../../data/models/MatchDayModel.dart';

abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesError extends MatchesState {
  final String message;

  MatchesError({required this.message});
}

class MatchesSuccess extends MatchesState {
  final List<MatchDayModel> matches;

  MatchesSuccess({required this.matches});
}
