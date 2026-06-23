import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../core/resources/routes_managers.dart';
import '../../../../../../core/utils/timer_format_helper.dart';

class TopNewsItemWidget extends StatefulWidget {
  final ArticleModel news;

  const TopNewsItemWidget({super.key, required this.news});

  @override
  State<TopNewsItemWidget> createState() => _TopNewsItemWidgetState();
}

class _TopNewsItemWidgetState extends State<TopNewsItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300 + (widget.news.hashCode % 5) * 100),
      tween: Tween<double>(begin: 40.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: Opacity(
            opacity: (1 - value / 40).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () async {
          Navigator.pushNamed(
            context,
            RoutesManager.articleDetails,
            arguments: widget.news,
          );
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorsManagers.gray3, width: 1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: Directionality.of(context),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.news.imageUrl ?? "",
                      width: 105.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          Container(color: Colors.grey.shade300),
                      errorWidget: (_, __, ___) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
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
                            borderRadius: BorderRadius.circular(8.r),
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

                        Text(
                          widget.news.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        ),

                        SizedBox(height: 10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "منذ ${TimeFormatHelper.formatDate(widget.news.publishedDate)}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                color: ColorsManagers.gray3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 3.w,
                              height: 3.w,
                              decoration: BoxDecoration(
                                color: ColorsManagers.gray3,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: Text(
                                widget.news.sourceName ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 12.sp,
                                  color: ColorsManagers.gray3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              end: 5.w,
              bottom: 8.h,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  SharePlus.instance.share(
                    ShareParams(text: widget.news.articleUrl ?? ''),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                    color: ColorsManagers.dark,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.share_outlined,
                    color: getCategoryTextColor(widget.news.category),
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              end: 40.w,
              bottom: 8.h,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                    color: ColorsManagers.dark,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSelected
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    size: 20.sp,
                    color: getCategoryTextColor(widget.news.category),
                  ),
                ),
              ),
            ),
          ],
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
