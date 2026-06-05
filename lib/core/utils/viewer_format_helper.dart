class ViewFormatHelper {
  static String formatViews(int? views) {
    if (views == null) {
      return "0";
    }

    if (views >= 1000000) {
      return "${(views / 1000000).toStringAsFixed(1)}M";
    }

    if (views >= 1000) {
      return "${(views / 1000).toStringAsFixed(1)}K";
    }

    return views.toString();
  }
}
