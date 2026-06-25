import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

class HomeTabModel {
  final String id;
  final String name;
  final String emoji;
  final String? route;

  HomeTabModel({
    required this.id,
    required this.name,
    required this.emoji,
    this.route,
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
        route: RoutesManager.trendingNews,
      ),
      HomeTabModel(
        id: '3',
        name: l10n.latest,
        emoji: "🕐",
        route: RoutesManager.topNews,
      ),
      HomeTabModel(
        id: '4',
        name: l10n.most_read,
        emoji: "📖",
        route: RoutesManager.mostRead,
      ),
    ];
  }
}