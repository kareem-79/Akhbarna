import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/CategoriesResponseModel.dart';
import '../repositories/category_repository.dart';

@injectable
class GetCategoryNewsUseCase {
  CategoryRepository repository;

  GetCategoryNewsUseCase({required this.repository});

  Future<Either<Failure, CategoriesResponseModel>> call() {
    return repository.getCategoryNews();
  }
}
