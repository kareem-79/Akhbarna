import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';

import '../../data/models/ArticleModel.dart';

import '../repositories/home_repository.dart';

@injectable
class GetBreakingNewsUseCase {
  HomeRepository repository;

  GetBreakingNewsUseCase(this.repository);

  Future<Either<Failure, List<ArticleModel>>> call() {
    return repository.getBreakingNews();
  }
}
