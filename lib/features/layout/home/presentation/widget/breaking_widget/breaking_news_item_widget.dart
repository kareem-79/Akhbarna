import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../core/utils/timer_format_helper.dart';
import '../../../../../../core/utils/viewer_format_helper.dart';
import '../../../../../../provider/book_market_provider.dart';
import '../../../data/models/ArticleModel.dart';

class BreakingNewsItemWidget extends StatelessWidget {
  final ArticleModel news;

  const BreakingNewsItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    Color cardColor = Theme.of(context).cardColor;

    final provider = Provider.of<BookmarkProvider>(context);

    final isSelected = provider.isBookmarked(news);

    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(news.articleUrl ?? "");

        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      },

      child: Container(
        width: 330.w,
        height: 200.h,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),

        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),

                child: CachedNetworkImage(
                  imageUrl: news.imageUrl ?? "",

                  fit: BoxFit.cover,

                  cacheKey: news.imageUrl,

                  useOldImageOnUrlChange: true,

                  fadeInDuration: Duration.zero,

                  fadeOutDuration: Duration.zero,

                  placeholder: (context, url) {
                    return Container(color: Colors.grey.shade300);
                  },

                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.grey.shade300,

                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    );
                  },
                ),
              ),
            ),

            PositionedDirectional(
              top: 15.h,
              start: 15.w,

              child: GestureDetector(
                onTap: () {
                  provider.toggleBookmark(news);
                },

                child: CircleAvatar(
                  radius: 20.r,

                  backgroundColor: ColorsManagers.white.withOpacity(.4),

                  child: Icon(
                    isSelected
                        ? Icons.bookmark
                        : Icons.bookmark_border_outlined,

                    size: 24.sp,

                    color: ColorsManagers.red,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,

              child: Container(
                width: double.infinity,

                padding: EdgeInsets.all(12.sp),

                decoration: BoxDecoration(
                  color: cardColor.withOpacity(.7),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),

                    bottomRight: Radius.circular(30.r),
                  ),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,

                                backgroundColor: Colors.transparent,

                                child: Icon(
                                  Icons.public,

                                  color: ColorsManagers.white,
                                ),
                              ),

                              SizedBox(width: 8.w),

                              Flexible(
                                child: Text(
                                  news.sourceName ?? "",
                                  style: textTheme.bodySmall,

                                  maxLines: 1,

                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,

                            vertical: 4.h,
                          ),

                          decoration: BoxDecoration(
                            color: ColorsManagers.red,

                            borderRadius: BorderRadius.circular(20.r),
                          ),

                          child: Text("عاجل", style: textTheme.bodySmall),
                        ),
                      ],
                    ),

                    Text(
                      news.title ?? "",
                      textDirection: TextDirection.rtl,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),

                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,

                          size: 16.sp,

                          color: ColorsManagers.gray3,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          ViewFormatHelper.formatViews(news.viewCount),

                          style: textTheme.bodySmall?.copyWith(
                            color: ColorsManagers.gray3,
                          ),
                        ),

                        const Spacer(),

                        Icon(
                          Icons.access_time,

                          size: 16.sp,

                          color: ColorsManagers.gray3,
                        ),

                        SizedBox(width: 4.w),

                        Expanded(
                          child: Text(
                            "منذ ${TimeFormatHelper.formatDate(news.publishedDate)}",

                            style: textTheme.bodySmall?.copyWith(
                              color: ColorsManagers.gray3,
                            ),

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
