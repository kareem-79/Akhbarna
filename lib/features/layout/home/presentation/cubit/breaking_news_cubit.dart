import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/get_breaking_news_use_case.dart';

import 'state/breaking_news_state.dart';

@injectable
class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  GetBreakingNewsUseCase getBreakingNewsUseCase;

  BreakingNewsCubit({required this.getBreakingNewsUseCase})
    : super(BreakingNewsInitial());

  Future<void> getBreakingNews() async {
    emit(BreakingNewsLoading());

    final result = await getBreakingNewsUseCase();

    result.fold(
      (failure) {
        emit(BreakingNewsError(message: failure.message));
      },

      (newsList) {
        emit(BreakingNewsSuccess(newsList: newsList));
      },
    );
  }
}
