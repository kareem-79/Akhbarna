import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ArticleModel>>> getBreakingNews();

  Future<Either<Failure, List<ArticleModel>>> getMostReadNews({
    required int top,
  });

  Future<Either<Failure, List<ArticleModel>>> getLatestNews({required int top});

  Future<Either<Failure, List<ArticleModel>>> getTrendingNews({
    required int top,
  });

  Future<Either<Failure, List<ArticleModel>>> searchArticles({
    required String keyword,
  });
}
