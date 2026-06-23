import '../../models/ArticleModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<ArticleModel>> getBreakingNews();

  Future<List<ArticleModel>> getMostReadNews({required int top});

  Future<List<ArticleModel>> getLatestNews({required int top});

  Future<List<ArticleModel>> getTrendingNews({required int top});

  Future<List<ArticleModel>> searchArticles({required String keyword});
}
