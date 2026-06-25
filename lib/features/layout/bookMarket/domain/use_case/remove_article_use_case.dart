import 'package:injectable/injectable.dart';

import '../repositories/book_market_repository.dart';

@injectable
class RemoveArticleUseCase {
  final BookMarketRepository repository;

  RemoveArticleUseCase({required this.repository});

  call(String articleId) {
    return repository.removeArticle(articleId);
  }
}
