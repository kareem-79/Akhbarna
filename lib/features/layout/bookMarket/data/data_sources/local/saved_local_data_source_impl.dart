import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../auth/register/data/data_sources/local/auth_local_data_source.dart';
import '../../../../home/data/models/ArticleModel.dart';
import 'saved_local_data_source.dart';

@Singleton(as: SavedLocalDataSource)
class SavedLocalDataSourceImpl implements SavedLocalDataSource {
  final AuthLocalDataSource authLocalDataSource;

  SavedLocalDataSourceImpl({required this.authLocalDataSource});

  Future<String> _getKey() async {
    final userId = await authLocalDataSource.getUserId();
    return "bookmarks_$userId";
  }

  @override
  Future<void> saveArticle(ArticleModel article) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final key = await _getKey();

      final list = await getSavedArticles();

      final exists = list.any((e) => e.id == article.id);

      if (!exists) {
        list.add(article);

        await prefs.setString(
          key,
          jsonEncode(list.map((e) => e.toJson()).toList()),
        );
      }
    } catch (_) {
      throw LocalException(message: "Failed to save article");
    }
  }

  @override
  Future<void> removeArticle(String articleId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final key = await _getKey();

      final list = await getSavedArticles();

      list.removeWhere((e) => e.id == articleId);

      await prefs.setString(
        key,
        jsonEncode(list.map((e) => e.toJson()).toList()),
      );
    } catch (_) {
      throw LocalException(message: "Failed to remove article");
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final key = await _getKey();

      final json = prefs.getString(key);

      if (json == null) return [];

      final List decoded = jsonDecode(json);

      return decoded.map((e) => ArticleModel.fromJson(e)).toList();
    } catch (_) {
      throw LocalException(message: "Failed to load saved articles");
    }
  }

  @override
  Future<bool> isSaved(String articleId) async {
    try {
      final list = await getSavedArticles();

      return list.any((e) => e.id == articleId);
    } catch (_) {
      throw LocalException(message: "Failed to check saved article");
    }
  }

  @override
  Future<void> removeAllArticles() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final key = await _getKey();

      await prefs.remove(key);
    } catch (_) {
      throw LocalException(message: "Failed to remove all articles");
    }
  }
}
