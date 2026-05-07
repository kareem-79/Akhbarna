import 'package:akhbarna/core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../provider/book_market_provider.dart';
import '../../../home/presentation/widget/breaking_news_item_widget.dart';
import '../widget/book_market_header_widget.dart';

class BookMarketTab extends StatelessWidget {
  const BookMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;
    final provider = Provider.of<BookmarkProvider>(context);
    final bookmarks = provider.bookmarks;

    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BookMarketHeaderWidget(),

          Expanded(
            child: bookmarks.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconManagers.save,
                    width: 100.w,
                    height: 100.h,
                    color: shadowColor,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "لا يوجد اخبار",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                SectionHeaderWidget(title: "عاجل"),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 240.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: bookmarks.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      final news = bookmarks[index];
                      return BreakingNewsItemWidget(news: news);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
