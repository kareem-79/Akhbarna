import 'package:flutter/material.dart';
import '../model/breaking_news_model.dart';

class BookmarkProvider extends ChangeNotifier {
  final List<BreakingNewsModel> _bookmarks = [];

  List<BreakingNewsModel> get bookmarks => _bookmarks;

  void toggleBookmark(BreakingNewsModel news) {
    if (_bookmarks.contains(news)) {
      _bookmarks.remove(news);
    } else {
      _bookmarks.add(news);
    }
    notifyListeners();
  }

  bool isBookmarked(BreakingNewsModel news) {
    return _bookmarks.contains(news);
  }
}