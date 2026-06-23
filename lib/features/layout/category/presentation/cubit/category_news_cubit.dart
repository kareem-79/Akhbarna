import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/get_category_news_use_case.dart';
import 'category_news_state.dart';

@lazySingleton
class CategoryNewsCubit extends Cubit<CategoryNewsState> {
  GetCategoryNewsUseCase getCategoryNewsUseCase;

  CategoryNewsCubit({required this.getCategoryNewsUseCase})
    : super(CategoryNewsInitial());

  Future<void> getCategoryNews() async {
    emit(CategoryNewsLoading());
    final result = await getCategoryNewsUseCase();
    result.fold(
      (failure) {
        emit(CategoryNewsError(message: failure.message));
      },
      (categoriesResponse) {
        emit(CategoryNewsSuccess(categoriesResponse: categoriesResponse));
      },
    );
  }
}
