import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/ArticleModel.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_remote_data_source.dart';
import '../models/CategoriesResponseModel.dart';

@Singleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CategoriesResponseModel>> getCategoryNews() async {
    try {
      final response = await remoteDataSource.getCategoryNews();
      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> searchCategoryArticles({
    required String keyword,
    required String category,
  }) async {
    try {
      final response = await remoteDataSource.searchCategoryArticles(
        keyword: keyword,
        category: category,
      );

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
