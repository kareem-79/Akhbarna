import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/ArticleModel.dart';
import '../repositories/category_repository.dart';

@injectable
class SearchCategoryArticlesUseCase {
  final CategoryRepository repository;

  SearchCategoryArticlesUseCase({required this.repository});

  Future<Either<Failure, List<ArticleModel>>> call({
    required String keyword,
    required String category,
  }) {
    return repository.searchCategoryArticles(
      keyword: keyword,
      category: category,
    );
  }
}
