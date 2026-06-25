import 'package:injectable/injectable.dart';

import '../repositories/book_market_repository.dart';

@injectable
class RemoveAllArticlesUseCase {
  final BookMarketRepository repository;

  RemoveAllArticlesUseCase({
    required this.repository,
  });

  Future call() {
    return repository.removeAllArticles();
  }
}