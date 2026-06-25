import '../../../../home/data/models/ArticleModel.dart';

abstract class CategorySearchState {}

class CategorySearchInitial extends CategorySearchState {}

class CategorySearchLoading extends CategorySearchState {}

class CategorySearchSuccess extends CategorySearchState {
  final List<ArticleModel> articles;

  CategorySearchSuccess({
    required this.articles,
  });
}

class CategorySearchError extends CategorySearchState {
  final String message;

  CategorySearchError({
    required this.message,
  });
}