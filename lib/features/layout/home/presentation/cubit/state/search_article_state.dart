import '../../../data/models/ArticleModel.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}

class SearchSuccess extends SearchState {
  final List<ArticleModel> articles;

  SearchSuccess({required this.articles});
}