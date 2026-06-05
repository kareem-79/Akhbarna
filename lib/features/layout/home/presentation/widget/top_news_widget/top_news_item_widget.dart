import 'package:akhbarna/model/top_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNewsItemWidget extends StatelessWidget {
  final TopNewsModel news;

  const TopNewsItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardColor = Theme.of(context).cardColor;

    return Container(
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
                        child: Image.asset(news.source),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          news.sourceTitle,
                          style: textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    news.title,
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
                    child: Text(news.time, style: textTheme.bodySmall),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(news.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
