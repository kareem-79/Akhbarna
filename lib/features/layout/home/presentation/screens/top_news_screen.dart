import 'package:akhbarna/features/layout/home/presentation/widget/top_news_header_screen.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/top_news_item_widget.dart';
import 'package:akhbarna/model/top_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNewsScreen extends StatefulWidget {
  const TopNewsScreen({super.key});

  @override
  State<TopNewsScreen> createState() => _TopNewsScreenState();
}

class _TopNewsScreenState extends State<TopNewsScreen> {
  List<TopNewsModel> topList = [];
  List<TopNewsModel> visibleTopNews = [];

  final ScrollController scrollController = ScrollController();

  final int loadCount = 10;

  @override
  void initState() {
    super.initState();

    topList = topNewsList;

    visibleTopNews = topList.take(loadCount).toList();

    scrollController.addListener(loadMore);
  }

  void loadMore() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 300) {
      if (visibleTopNews.length < topList.length) {
        setState(() {
          final next = visibleTopNews.length + loadCount;

          visibleTopNews = topList.take(next).toList();
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNewsHeaderWidget(),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: TopNewsItemWidget(
                            news: visibleTopNews[index],
                          ),
                        );
                      },
                      childCount: visibleTopNews.length,
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