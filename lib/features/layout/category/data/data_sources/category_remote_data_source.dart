import '../models/CategoriesResponseModel.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoriesResponseModel> getCategoryNews();
}