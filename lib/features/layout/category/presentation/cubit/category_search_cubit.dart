import 'package:akhbarna/features/layout/category/presentation/cubit/state/category_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/search_category_articles_use_case.dart';

@lazySingleton
class CategorySearchCubit extends Cubit<CategorySearchState> {
  final SearchCategoryArticlesUseCase searchCategoryArticlesUseCase;

  CategorySearchCubit({required this.searchCategoryArticlesUseCase})
    : super(CategorySearchInitial());

  Future<void> search({
    required String keyword,
    required String category,
  }) async {
    emit(CategorySearchLoading());

    final result = await searchCategoryArticlesUseCase(
      keyword: keyword,
      category: category,
    );

    result.fold(
      (failure) {
        emit(CategorySearchError(message: failure.message));
      },
      (articles) {
        emit(CategorySearchSuccess(articles: articles));
      },
    );
  }

  void clearSearch() {
    emit(CategorySearchInitial());
  }
}
