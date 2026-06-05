class TimeFormatHelper {

  static String formatDate(
      String? date,
      ) {

    if (date == null ||
        date.isEmpty) {

      return "";
    }

    final publishedDate =
    DateTime.parse(date);

    final now = DateTime.now();

    final difference =
    now.difference(
        publishedDate);

    if (difference.inSeconds < 60) {

      return "الآن";
    }

    if (difference.inMinutes < 60) {

      return
        "${difference.inMinutes} دقيقة";
    }

    if (difference.inHours < 24) {

      return
        "${difference.inHours} ساعة";
    }

    if (difference.inDays < 7) {

      return
        "${difference.inDays} يوم";
    }

    return
      "${publishedDate.day}/${publishedDate.month}/${publishedDate.year}";
  }
}