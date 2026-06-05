import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../provider/book_market_provider.dart';
import '../../../home/presentation/widget/breaking_widget/breaking_news_item_widget.dart';
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
          SizedBox(height: 10.h),
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
                : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final news = bookmarks[index];

                        return Padding(
                          padding:
                          EdgeInsets.only(bottom: 10.h),
                          child: BreakingNewsItemWidget(
                            news: news,
                          ),
                        );
                      },
                      childCount: bookmarks.length,
                    ),
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