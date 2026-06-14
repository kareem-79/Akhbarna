import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/CategoriesResponseModel.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoriesResponseModel>> getCategoryNews();
}
