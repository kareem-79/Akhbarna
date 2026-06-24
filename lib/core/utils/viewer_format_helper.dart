import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

class ViewFormatHelper {
  static String formatViews(
      BuildContext context,
      int? views,
      ) {
    final l10n = AppLocalizations.of(context)!;

    if (views == null) {
      return "0";
    }

    if (views >= 1000000) {
      return "${(views / 1000000).toStringAsFixed(1)} ${l10n.million_short}";
    }

    if (views >= 1000) {
      return "${(views / 1000).toStringAsFixed(1)} ${l10n.thousand_short}";
    }

    return views.toString();
  }
}