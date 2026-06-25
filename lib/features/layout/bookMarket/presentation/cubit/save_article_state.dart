import '../../../home/data/models/ArticleModel.dart';

abstract class BookMarketState {}

class BookMarketInitial extends BookMarketState {}

class BookMarketLoading extends BookMarketState {}

class BookMarketSuccess extends BookMarketState {
  final List<ArticleModel> articles;
  final Set<String> savedIds;

  BookMarketSuccess({
    required this.articles,
    required this.savedIds,
  });
}

class BookMarketError extends BookMarketState {
  final String message;

  BookMarketError({
    required this.message,
  });
}