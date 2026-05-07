import 'package:akhbarna/model/breaking_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../provider/book_market_provider.dart';

class BreakingNewsItemWidget extends StatelessWidget {
  final BreakingNewsModel news;

  const BreakingNewsItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    final provider = Provider.of<BookmarkProvider>(context);
    final isSelected = provider.isBookmarked(news);

    return Container(
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        image: DecorationImage(
          image: AssetImage(news.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 15.h,
            start: 15.w,
            child: GestureDetector(
              onTap: () => provider.toggleBookmark(news),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManagers.white.withOpacity(.4),
                child: Icon(
                  isSelected ? Icons.bookmark : Icons.bookmark_border_outlined,
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
                              child: Padding(
                                padding: EdgeInsets.all(2.r),
                                child: Image.asset(news.source, fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Flexible(
                              child: Text(
                                news.sourceTitle,
                                style: textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: ColorsManagers.red,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "عاجل",
                          style: textTheme.bodySmall
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    news.title,
                    style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    news.time,
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorsManagers.gray3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
