import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../core/resources/routes_managers.dart';
import '../../../data/models/ArticleModel.dart';

class BreakingNewsItemWidget extends StatefulWidget {
  final ArticleModel news;

  const BreakingNewsItemWidget({super.key, required this.news});

  @override
  State<BreakingNewsItemWidget> createState() => _BreakingNewsItemWidgetState();
}

class _BreakingNewsItemWidgetState extends State<BreakingNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final canvasColor = Theme.of(context).canvasColor;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.articleDetails,
          arguments: widget.news,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [canvasColor, bgColor],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: widget.news.imageUrl ?? "",
                height: 90.h,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (_, __) => Container(color: ColorsManagers.gray2),
                errorWidget: (_, __, ___) => Container(
                  color: ColorsManagers.gray2,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: getCategoryTextColor(
                            widget.news.category,
                          ).withOpacity(.3),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          widget.news.category ?? "",
                          style: textTheme.bodySmall?.copyWith(
                            color: getCategoryTextColor(widget.news.category),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Expanded(
                        child: Text(
                          widget.news.title ?? "",
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        widget.news.sourceName ?? "",
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                          color: ColorsManagers.gray3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getCategoryTextColor(String? category) {
    switch (category?.trim()) {
      case "رياضة":
        return ColorsManagers.pinkDark;

      case "تكنولوجيا":
        return ColorsManagers.mintDark;

      case "سياسة":
        return ColorsManagers.aquaDark;

      case "اقتصاد":
        return ColorsManagers.yellowDark;

      case "صحة":
        return ColorsManagers.purpleDark;

      case "ترفيه":
        return ColorsManagers.orangeDark;

      case "علوم":
        return ColorsManagers.skyBlueDark;

      case "دولي":
        return ColorsManagers.roseDark;

      default:
        return ColorsManagers.roseDark;
    }
  }
}
