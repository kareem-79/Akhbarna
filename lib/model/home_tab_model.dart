import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return [
      HomeTabModel(
        id: '1',
        name: l10n.breaking,
        emoji: "🚨",
      ),
      HomeTabModel(
        id: '2',
        name: l10n.most_trending,
        emoji: "🔥",
      ),
      HomeTabModel(
        id: '3',
        name: l10n.latest,
        emoji: "🕐",
      ),
      HomeTabModel(
        id: '4',
        name: l10n.most_read,
        emoji: "📖",
      ),
    ];
  }
}