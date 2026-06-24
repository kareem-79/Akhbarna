import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String image;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.image,
    this.isSelected = false,
  });

  static List<CategoryModel> categories(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      CategoryModel(name: l10n.sports, image: CategoryImageManagers.sports),
      CategoryModel(name: l10n.economy, image: CategoryImageManagers.economy),
      CategoryModel(name: l10n.health, image: CategoryImageManagers.health),
      CategoryModel(name: l10n.entertainment, image: CategoryImageManagers.art),
      CategoryModel(name: l10n.politics, image: CategoryImageManagers.policy),
      CategoryModel(
        name: l10n.technology,
        image: CategoryImageManagers.technology,
      ),
    ];
  }
}
