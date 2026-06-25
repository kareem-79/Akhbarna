import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/ArticleModel.dart';

abstract class BookMarketRepository {
  Future<Either<Failure, void>> saveArticle(ArticleModel article);

  Future<Either<Failure, void>> removeArticle(String articleId);

  Future<Either<Failure, List<ArticleModel>>> getSavedArticles();

  Future<Either<Failure, bool>> isSaved(String articleId);

  Future<Either<Failure, void>> removeAllArticles();
  }
