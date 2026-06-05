import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MostReadNewsItemWidget extends StatelessWidget {
  final ArticleModel news;

  const MostReadNewsItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;

    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(news.articleUrl ?? "");
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      },
      child: Container(
        height: 150.h,

        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(30.r),
        ),

        child: Padding(
          padding: EdgeInsets.all(16.sp),

          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),

                child: CachedNetworkImage(
                  imageUrl: news.imageUrl ?? "",

                  width: 100.w,

                  height: 100.h,
                  useOldImageOnUrlChange: true,

                  fadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,

                  fit: BoxFit.cover,

                  placeholder: (context, url) {
                    return const Center(child: CircularProgressIndicator());
                  },

                  errorWidget: (context, url, error) {
                    return Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      news.title ?? "",

                      style: textTheme.bodySmall,

                      overflow: TextOverflow.ellipsis,

                      maxLines: 2,
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,

                          child: Icon(Icons.public),
                        ),

                        SizedBox(width: 10.w),

                        Expanded(
                          child: Text(
                            news.sourceName ?? "",

                            style: textTheme.bodySmall,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.share_outlined),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
