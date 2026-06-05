import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/remote/home_remote_data_source.dart';
import '../models/ArticleModel.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ArticleModel>>> getBreakingNews() async {
    try {
      final response = await remoteDataSource.getBreakingNews();

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getMostReadNews({
    required int top,
  }) async {
    try {
      final response = await remoteDataSource.getMostReadNews(top: top);

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
