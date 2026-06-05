import '../../data/models/ArticleModel.dart';

abstract class MostReadNewsState {}

class MostReadNewsInitial extends MostReadNewsState {}

class MostReadNewsLoading extends MostReadNewsState {}

class MostReadNewsSuccess extends MostReadNewsState {
  List<ArticleModel> articles;

  MostReadNewsSuccess({required this.articles});
}

class MostReadNewsError extends MostReadNewsState {
  String message;

  MostReadNewsError({required this.message});
}
