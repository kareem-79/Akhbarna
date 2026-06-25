import '../../../../home/data/models/ArticleModel.dart';

abstract class SavedLocalDataSource {
  Future<void> saveArticle(ArticleModel article);

  Future<void> removeArticle(String articleId);

  Future<List<ArticleModel>> getSavedArticles();

  Future<void> removeAllArticles();

  Future<bool> isSaved(String articleId);
}
