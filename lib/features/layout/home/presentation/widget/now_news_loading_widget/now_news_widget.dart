import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/resources/assets_managers.dart';
import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../core/utils/timer_format_helper.dart';
import '../../../data/models/ArticleModel.dart';

class NowNewsWidget extends StatefulWidget {
  final ArticleModel article;

  const NowNewsWidget({super.key, required this.article});

  @override
  State<NowNewsWidget> createState() => _NowNewsWidgetState();
}

class _NowNewsWidgetState extends State<NowNewsWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final canvasColor = Theme.of(context).canvasColor;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(widget.article.articleUrl ?? "");
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      },
      child: Container(
        height: 400.h,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [canvasColor, bgColor],
          ),
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.article.imageUrl ?? "",
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Container(color: Colors.grey.shade300),
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image),
                    ),
                  ),
                ),

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
                        isSelected
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        size: 30.sp,
                        color: ColorsManagers.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  SourceImageManagers.elarabia,
                  width: 60.w,
                  height: 60.h,
                ),
                SizedBox(width: 12.w),
                Text(
                  widget.article.sourceName ?? "",
                  style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
                ),
                Spacer(),
                Container(
                  width: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorsManagers.red,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(child: Text("تريند", style: textTheme.bodySmall)),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              widget.article.title ?? "",
              textDirection: TextDirection.rtl,
              style: textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            Text(
              "منذ ${TimeFormatHelper.formatDate(widget.article.publishedDate)}",
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                color: ColorsManagers.gray3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
