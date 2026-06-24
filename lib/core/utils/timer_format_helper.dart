import 'package:flutter/material.dart';
import 'package:akhbarna/l10n/app_localizations.dart';

class TimeFormatHelper {
  static String formatDate(
      BuildContext context,
      String? date,
      ) {
    final l10n = AppLocalizations.of(context)!;

    if (date == null || date.isEmpty) {
      return "";
    }

    final publishedDate = DateTime.parse(date);
    final now = DateTime.now();

    final difference = now.difference(publishedDate);

    if (difference.inSeconds < 60) {
      return l10n.now;
    }

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} ${l10n.time_minute}";
    }

    if (difference.inHours < 24) {
      return "${difference.inHours} ${l10n.time_hour}";
    }

    if (difference.inDays < 7) {
      return "${difference.inDays} ${l10n.time_day}";
    }

    return "${publishedDate.day}/${publishedDate.month}/${publishedDate.year}";
  }
}