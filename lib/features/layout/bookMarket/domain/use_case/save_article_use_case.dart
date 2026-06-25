import 'package:injectable/injectable.dart';

import '../../../home/data/models/ArticleModel.dart';
import '../repositories/book_market_repository.dart';

@injectable
class SaveArticleUseCase {
  final BookMarketRepository repository;

  SaveArticleUseCase({
    required this.repository,
  });

  call(ArticleModel article) {
    return repository.saveArticle(article);
  }
}