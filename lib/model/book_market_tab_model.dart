import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

class BookMarketTabModel {
  final String id;
  final String title;
  final String emoji;

  const BookMarketTabModel({
    required this.id,
    required this.title,
    required this.emoji,
  });

  static List<BookMarketTabModel> tabs(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      BookMarketTabModel(
        id: "all",
        title: l10n.all,
        emoji: "📚",
      ),
      BookMarketTabModel(
        id: "دولي",
        title: l10n.international,
        emoji: "🌍",
      ),
      BookMarketTabModel(
        id: "رياضة",
        title: l10n.sports,
        emoji: "⚽",
      ),
      BookMarketTabModel(
        id: "اقتصاد",
        title: l10n.economy,
        emoji: "💰",
      ),
      BookMarketTabModel(
        id: "سياسة",
        title: l10n.politics,
        emoji: "🏛️",
      ),
      BookMarketTabModel(
        id: "تكنولوجيا",
        title: l10n.technology,
        emoji: "💻",
      ),
      BookMarketTabModel(
        id: "صحة",
        title: l10n.health,
        emoji: "🩺",
      ),
      BookMarketTabModel(
        id: "فن",
        title: l10n.entertainment,
        emoji: "🎭",
      ),
      BookMarketTabModel(
        id: "علوم",
        title: l10n.science,
        emoji: "🔬",
      ),
    ];
  }
}