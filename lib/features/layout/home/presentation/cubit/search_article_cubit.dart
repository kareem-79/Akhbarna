import 'package:akhbarna/features/layout/home/presentation/cubit/state/search_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/get_search_articles_use_case.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final SearchArticlesUseCase searchArticlesUseCase;

  SearchCubit({required this.searchArticlesUseCase}) : super(SearchInitial());

  Future<void> search({required String keyword}) async {
    if (keyword.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final result = await searchArticlesUseCase(keyword: keyword);

    result.fold(
      (failure) {
        emit(SearchError(message: failure.message));
      },
      (articles) {
        emit(SearchSuccess(articles: articles));
      },
    );
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
