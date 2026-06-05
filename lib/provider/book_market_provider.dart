import 'package:flutter/material.dart';

import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';

class BookmarkProvider extends ChangeNotifier {
  final List<ArticleModel> _bookmarks = [];

  List<ArticleModel> get bookmarks => _bookmarks;

  void toggleBookmark(ArticleModel news) {
    if (_bookmarks.contains(news)) {
      _bookmarks.remove(news);
    } else {
      _bookmarks.add(news);
    }

    notifyListeners();
  }

  bool isBookmarked(ArticleModel news) {
    return _bookmarks.contains(news);
  }
}
