import 'package:akhbarna/features/layout/home/presentation/widget/most_read_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/most_read_model.dart';
import '../widget/most_read_news_item_widget.dart';

class MostReadScreen extends StatefulWidget {
  const MostReadScreen({super.key});

  @override
  State<MostReadScreen> createState() => _MostReadScreenState();
}

class _MostReadScreenState extends State<MostReadScreen> {
  List<MostReadModel> mostReadList = [];
  List<MostReadModel> visibleMostRead = [];

  final ScrollController scrollController = ScrollController();

  final int loadCount = 10;

  @override
  void initState() {
    super.initState();

    mostReadList = mostReadNewsList;

    visibleMostRead = mostReadList.take(loadCount).toList();

    scrollController.addListener(loadMore);
  }

  void loadMore() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 300) {
      if (visibleMostRead.length < mostReadList.length) {
        setState(() {
          final next = visibleMostRead.length + loadCount;

          visibleMostRead = mostReadList.take(next).toList();
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
          MostReadHeaderWidget(),
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
                          child: MostReadNewsItemWidget(
                            news: visibleMostRead[index],
                          ),
                        );
                      },
                      childCount: visibleMostRead.length,
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