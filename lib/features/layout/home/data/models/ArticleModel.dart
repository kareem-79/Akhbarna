class ArticleModel {
  ArticleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sourceUrl,
    required this.articleUrl,
    required this.category,
    required this.sourceName,
    required this.publishedDate,
    required this.viewCount,
    required this.isBreaking,
    required this.sourceLogoUrl,
    required this.sourceLogoFallbackUrl,
  });

  factory ArticleModel.fromJson(dynamic json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      sourceUrl: json['sourceUrl'],
      articleUrl: json['articleUrl'],
      category: json['category'],
      sourceName: json['sourceName'],
      publishedDate: json['publishedDate'],
      viewCount: json['viewCount'],
      isBreaking: json['isBreaking'],
      sourceLogoUrl: json['sourceLogoUrl'],
      sourceLogoFallbackUrl: json['sourceLogoFallbackUrl'],
    );
  }

  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? sourceUrl;
  final String? articleUrl;
  final String? category;
  final String? sourceName;
  final String? publishedDate;
  final int? viewCount;
  final bool? isBreaking;
  final String? sourceLogoUrl;
  final String? sourceLogoFallbackUrl;
}
