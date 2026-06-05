import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/timer_format_helper.dart';

class TopNewsItemWidget extends StatelessWidget {
  final ArticleModel news;

  const TopNewsItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardColor = Theme.of(context).cardColor;

    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(news.articleUrl ?? "");
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      },
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Column(
            children: [
              Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

                color: cardColor,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,

                          backgroundColor: Colors.transparent,

                          child: const Icon(Icons.public),
                        ),

                        SizedBox(width: 8.w),

                        Expanded(
                          child: Text(
                            news.sourceName ?? "",

                            style: textTheme.bodySmall,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const Spacer(),

                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              SharePlus.instance.share(
                                ShareParams(text: news.articleUrl ?? ''),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(Icons.share_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      news.title ?? "",

                      textDirection: TextDirection.rtl,

                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,

                        height: 1.4,
                      ),

                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 8.h),

                    Align(
                      alignment: Alignment.bottomLeft,

                      child: Text(
                        "منذ ${TimeFormatHelper.formatDate(news.publishedDate)}",

                        style: textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: CachedNetworkImage(
                  imageUrl: news.imageUrl ?? "",

                  fit: BoxFit.cover,

                  width: double.infinity,

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
            ],
          ),
        ),
      ),
    );
  }
}
