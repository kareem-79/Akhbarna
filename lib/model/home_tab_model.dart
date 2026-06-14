import 'package:flutter/material.dart';

class HomeTabModel {
  String id;
  String name;
  String emoji;

  HomeTabModel({
    required this.id,
    required this.name,
    required this.emoji,
  });

  static List<HomeTabModel> homeTabList(BuildContext context) {
    return [
      HomeTabModel(
        id: '1',
        name: "عاجل",
        emoji: "🚨",
      ),
      HomeTabModel(
        id: '2',
        name: "آخر الأخبار",
        emoji: "🕐",
      ),
      HomeTabModel(
        id: '3',
        name: "الأكثر قراءة",
        emoji: "📖",
      ),
    ];
  }
}