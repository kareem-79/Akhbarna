import '../../models/book_market_request.dart';

abstract class SavedRemoteDataSource {
  Future<void> saveArticle({
    required SaveArticleRequestModel request,
  });
}