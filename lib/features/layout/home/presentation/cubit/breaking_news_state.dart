import '../../data/models/ArticleModel.dart';

abstract class BreakingNewsState {}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoading extends BreakingNewsState {}

class BreakingNewsSuccess extends BreakingNewsState {
  List<ArticleModel> newsList;

  BreakingNewsSuccess({required this.newsList});
}

class BreakingNewsError extends BreakingNewsState {
  String message;

  BreakingNewsError({required this.message});
}
