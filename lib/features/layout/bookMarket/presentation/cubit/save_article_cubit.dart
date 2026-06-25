import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/ArticleModel.dart';
import '../../domain/use_case/get_saved_articles_use_case.dart';
import '../../domain/use_case/is_saved_article_use_case.dart';
import '../../domain/use_case/remove_all_articles_use_case.dart';
import '../../domain/use_case/remove_article_use_case.dart';
import '../../domain/use_case/save_article_use_case.dart';
import 'save_article_state.dart';

@injectable
class BookMarketCubit extends Cubit<BookMarketState> {
  final SaveArticleUseCase saveArticleUseCase;
  final RemoveArticleUseCase removeArticleUseCase;
  final GetSavedArticlesUseCase getSavedArticlesUseCase;
  final IsSavedArticleUseCase isSavedArticleUseCase;
  final RemoveAllArticlesUseCase removeAllArticlesUseCase;

  BookMarketCubit({
    required this.removeAllArticlesUseCase,
    required this.saveArticleUseCase,
    required this.removeArticleUseCase,
    required this.getSavedArticlesUseCase,
    required this.isSavedArticleUseCase,
  }) : super(BookMarketInitial());

  Future<void> loadSavedArticles() async {
    emit(BookMarketLoading());

    final result = await getSavedArticlesUseCase();

    result.fold(
      (failure) {
        emit(BookMarketError(message: failure.message));
      },
      (articles) {
        final Set<String> savedIds = <String>{};

        for (final ArticleModel article in articles) {
          if (article.id != null) {
            savedIds.add(article.id!);
          }
        }

        emit(BookMarketSuccess(articles: articles, savedIds: savedIds));
      },
    );
  }

  Future<void> saveArticle(ArticleModel article) async {
    final result = await saveArticleUseCase(article);

    result.fold(
      (failure) {
        emit(BookMarketError(message: failure.message));
      },
      (_) async {
        await loadSavedArticles();
      },
    );
  }

  Future<void> removeArticle(String articleId) async {
    final result = await removeArticleUseCase(articleId);

    result.fold(
      (failure) {
        emit(BookMarketError(message: failure.message));
      },
      (_) async {
        await loadSavedArticles();
      },
    );
  }

  Future<void> toggleBookmark(ArticleModel article) async {
    final result = await isSavedArticleUseCase(article.id!);

    result.fold(
      (failure) {
        emit(BookMarketError(message: failure.message));
      },
      (saved) async {
        if (saved) {
          await removeArticle(article.id!);
        } else {
          await saveArticle(article);
        }
      },
    );
  }
  Future<void> removeAllArticles() async {
    final result = await removeAllArticlesUseCase();

    result.fold(
          (failure) {
        emit(BookMarketError(message: failure.message));
      },
          (_) async {
        await loadSavedArticles();
      },
    );
  }
}
