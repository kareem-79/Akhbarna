import '../../../data/models/ArticleModel.dart';

abstract class TrendingNewsState {}

class TrendingNewsInitial extends TrendingNewsState {}

class TrendingNewsLoading extends TrendingNewsState {}

class TrendingNewsSuccess extends TrendingNewsState {
  final List<ArticleModel> articles;

  TrendingNewsSuccess({required this.articles});
}

class TrendingNewsError extends TrendingNewsState {
  final String message;

  TrendingNewsError({required this.message});
}
