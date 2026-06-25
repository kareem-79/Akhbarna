import '../../../home/data/models/ArticleModel.dart';
import '../models/CategoriesResponseModel.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoriesResponseModel> getCategoryNews();

  Future<List<ArticleModel>> searchCategoryArticles({
    required String keyword,
    required String category,
  });
}
