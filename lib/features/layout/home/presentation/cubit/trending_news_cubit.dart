import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/use_case/get_trending_news_use_case.dart';
import 'state/trending_news_state.dart';

@lazySingleton
class TrendingNewsCubit extends Cubit<TrendingNewsState> {
  final GetTrendingNewsUseCase getTrendingNewsUseCase;

  TrendingNewsCubit({required this.getTrendingNewsUseCase})
      : super(TrendingNewsInitial());

  Future<void> getTrendingNews({required int top}) async {
    emit(TrendingNewsLoading());

    final result = await getTrendingNewsUseCase(top: top);

    result.fold(
          (Failure failure) {
        emit(TrendingNewsError(message: failure.message));
      },
          (articles) {
        emit(TrendingNewsSuccess(articles: articles));
      },
    );
  }
}
