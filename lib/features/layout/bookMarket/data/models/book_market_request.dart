class SaveArticleRequestModel {
  final String externalArticleId;
  final int articleId;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String category;
  final String sourceName;
  final String sourceLogoUrl;

  SaveArticleRequestModel({
    required this.externalArticleId,
    required this.articleId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.articleUrl,
    required this.category,
    required this.sourceName,
    required this.sourceLogoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "externalArticleId": externalArticleId,
      "articleId": articleId,
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "articleUrl": articleUrl,
      "category": category,
      "sourceName": sourceName,
      "sourceLogoUrl": sourceLogoUrl,
    };
  }
}