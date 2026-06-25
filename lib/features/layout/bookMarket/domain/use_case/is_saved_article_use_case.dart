import 'package:injectable/injectable.dart';

import '../repositories/book_market_repository.dart';

@injectable
class IsSavedArticleUseCase {
  final BookMarketRepository repository;

  IsSavedArticleUseCase({
    required this.repository,
  });

  call(String articleId) {
    return repository.isSaved(articleId);
  }
}