import 'package:akhbarna/model/most_read_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostReadNewsItemWidget extends StatefulWidget {
  final MostReadModel news;

  const MostReadNewsItemWidget({super.key, required this.news});

  @override
  State<MostReadNewsItemWidget> createState() => _MostReadNewsItemWidgetState();
}

class _MostReadNewsItemWidgetState extends State<MostReadNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                image: DecorationImage(
                  image: AssetImage(widget.news.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.news.title,
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          widget.news.source,
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(widget.news.sourceTitle, style: textTheme.bodySmall),
                      Spacer(),
                      Icon(Icons.share_outlined),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
