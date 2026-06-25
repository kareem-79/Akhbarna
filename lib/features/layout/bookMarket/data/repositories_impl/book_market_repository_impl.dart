import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/ArticleModel.dart';
import '../../domain/repositories/book_market_repository.dart';
import '../data_sources/local/saved_local_data_source.dart';

@Injectable(as: BookMarketRepository)
class BookMarketRepositoryImpl implements BookMarketRepository {
  final SavedLocalDataSource localDataSource;

  BookMarketRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> saveArticle(ArticleModel article) async {
    try {
      await localDataSource.saveArticle(article);
      return const Right(null);
    } on LocalException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeArticle(String articleId) async {
    try {
      await localDataSource.removeArticle(articleId);
      return const Right(null);
    } on LocalException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getSavedArticles() async {
    try {
      final articles = await localDataSource.getSavedArticles();
      return Right(articles);
    } on LocalException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isSaved(String articleId) async {
    try {
      final saved = await localDataSource.isSaved(articleId);
      return Right(saved);
    } on LocalException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
  @override
  Future<Either<Failure, void>> removeAllArticles() async {
    try {
      await localDataSource.removeAllArticles();
      return const Right(null);
    } on LocalException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
