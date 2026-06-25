import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/ArticleModel.dart';
import '../../data/models/CategoriesResponseModel.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoriesResponseModel>> getCategoryNews();

  Future<Either<Failure, List<ArticleModel>>> searchCategoryArticles({
    required String keyword,
    required String category,
  });
}
