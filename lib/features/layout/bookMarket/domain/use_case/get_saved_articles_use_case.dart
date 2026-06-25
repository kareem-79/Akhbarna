import 'package:injectable/injectable.dart';

import '../repositories/book_market_repository.dart';

@injectable
class GetSavedArticlesUseCase {
  final BookMarketRepository repository;

  GetSavedArticlesUseCase({
    required this.repository,
  });

  call() {
    return repository.getSavedArticles();
  }
}