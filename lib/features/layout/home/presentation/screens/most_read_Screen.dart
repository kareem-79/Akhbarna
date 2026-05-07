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

  @override
  void initState() {
    super.initState();
    mostReadList = mostReadNewsList;
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
              padding: EdgeInsets.all(16.0.sp),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MostReadNewsItemWidget(news: mostReadList[index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.w),
                itemCount: mostReadList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
