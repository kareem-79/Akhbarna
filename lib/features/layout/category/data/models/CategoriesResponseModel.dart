import 'CategoryArticlesModel.dart';

class CategoriesResponseModel {
  final List<CategoryArticlesModel> categories;

  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    List<CategoryArticlesModel> categories = [];
    json.forEach((key, value) {
      categories.add(CategoryArticlesModel.fromJson(key, value));
    });

    return CategoriesResponseModel(categories: categories);
  }
}
