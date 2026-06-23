import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/get_matches_use_case.dart';
import 'matches_state.dart';

@lazySingleton
class MatchesCubit extends Cubit<MatchesState> {
  final GetMatchesUseCase getMatchesUseCase;

  MatchesCubit({required this.getMatchesUseCase}) : super(MatchesInitial());

  Future<void> getMatches() async {
    emit(MatchesLoading());

    final result = await getMatchesUseCase();

    result.fold(
      (failure) {
        emit(MatchesError(message: failure.message));
      },
      (matches) {
        emit(MatchesSuccess(matches: matches));
      },
    );
  }
}
