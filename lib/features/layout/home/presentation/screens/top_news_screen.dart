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

  @override
  void initState() {
    super.initState();
    topList = topNewsList;
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
              padding:  EdgeInsets.all(16.0.sp),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TopNewsItemWidget(news: topList[index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.w),
                itemCount: topList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
