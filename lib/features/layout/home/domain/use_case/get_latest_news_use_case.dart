import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class GetLatestNewsUseCase {
  final HomeRepository repository;

  GetLatestNewsUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<ArticleModel>>> call({
    required int top,
  }) {
    return repository.getLatestNews(
      top: top,
    );
  }
}