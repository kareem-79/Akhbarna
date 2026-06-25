import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

import '../core/resources/assets_managers.dart';

class CategoryTabModel {
  final String id;
  final String imagePath;
  final String title;

  CategoryTabModel({
    required this.id,
    required this.imagePath,
    required this.title,
  });

  static List<CategoryTabModel> categories(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      CategoryTabModel(
        id: "دولي",
        imagePath: CategoryTabImageManagers.international,
        title: l10n.international,
      ),

      CategoryTabModel(
        id: "رياضة",
        imagePath: CategoryTabImageManagers.sport,
        title: l10n.sports,
      ),
      CategoryTabModel(
        id: "اقتصاد",
        imagePath: CategoryTabImageManagers.economy,
        title: l10n.economy,
      ),

      CategoryTabModel(
        id: "سياسة",
        imagePath: CategoryTabImageManagers.politics,
        title: l10n.politics,
      ),

      CategoryTabModel(
        id: "تكنولوجيا",
        imagePath: CategoryTabImageManagers.technology,
        title: l10n.technology,
      ),

      CategoryTabModel(
        id: "صحة",
        imagePath: CategoryTabImageManagers.health,
        title: l10n.health,
      ),

      CategoryTabModel(
        id: "فن",
        imagePath: CategoryTabImageManagers.entertainment,
        title: l10n.entertainment,
      ),

      CategoryTabModel(
        id: "علوم",
        imagePath: CategoryTabImageManagers.sciences,
        title: l10n.science,
      ),
    ];
  }
}
