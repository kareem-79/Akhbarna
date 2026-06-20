

import '../../../data/models/ArticleModel.dart';

abstract class LatestNewsState {}

class LatestNewsInitial extends LatestNewsState {}

class LatestNewsLoading extends LatestNewsState {}

class LatestNewsSuccess extends LatestNewsState {
  final List<ArticleModel> articles;

  LatestNewsSuccess({required this.articles});
}

class LatestNewsError extends LatestNewsState {
  final String message;

  LatestNewsError({required this.message});
}
