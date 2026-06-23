import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/ArticleModel.dart';
import '../repositories/home_repository.dart';

@injectable
class SearchArticlesUseCase {
  final HomeRepository repository;

  SearchArticlesUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<ArticleModel>>> call({
    required String keyword,
  }) {
    return repository.searchArticles(
      keyword: keyword,
    );
  }
}