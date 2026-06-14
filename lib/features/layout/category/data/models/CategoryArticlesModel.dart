import '../../../home/data/models/ArticleModel.dart';

class CategoryArticlesModel {
  final String categoryName;
  final List<ArticleModel> articles;

  CategoryArticlesModel({
    required this.categoryName,
    required this.articles,
  });

  factory CategoryArticlesModel.fromJson(
      String categoryName,
      List<dynamic> json,
      ) {
    return CategoryArticlesModel(
      categoryName: categoryName,
      articles: json
          .map(
            (e) => ArticleModel.fromJson(e),
      )
          .toList(),
    );
  }
}