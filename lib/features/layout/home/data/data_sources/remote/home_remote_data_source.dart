import '../../models/ArticleModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<ArticleModel>> getBreakingNews();
  Future<List<ArticleModel>> getMostReadNews({required int top});
}
