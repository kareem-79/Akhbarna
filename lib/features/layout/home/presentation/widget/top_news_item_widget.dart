import 'package:akhbarna/model/top_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';

class TopNewsItemWidget extends StatefulWidget {
  final TopNewsModel news;

  const TopNewsItemWidget({super.key, required this.news});

  @override
  State<TopNewsItemWidget> createState() => _TopNewsItemWidgetState();
}

class _TopNewsItemWidgetState extends State<TopNewsItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    return Container(
      width: 350.w,
      height: 290.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        image: DecorationImage(
          image: AssetImage(widget.news.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 20.sp,
            start: 20.sp,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: CircleAvatar(
                backgroundColor: ColorsManagers.white.withOpacity(.4),
                child: Icon(
                  isSelected ? Icons.bookmark : Icons.bookmark_border_outlined,
                  size: 30.sp,
                  color: ColorsManagers.red,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: cardColor.withOpacity(.8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.sp,
                  vertical: 8.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                widget.news.source,
                                width: 40.w,
                                height: 40.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                widget.news.sourceTitle,
                                style: textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Container(
                            height: 25.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: ColorsManagers.red,
                              borderRadius: BorderRadius.circular(60.r),
                            ),
                            child: Center(
                              child: Text("عاجل", style: textTheme.bodySmall),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.news.title,
                      style: textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.news.time,
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorsManagers.gray3,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
