import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';

class TopNewsWidget extends StatefulWidget {
  const TopNewsWidget({super.key});

  @override
  State<TopNewsWidget> createState() => _TopNewsWidgetState();
}

class _TopNewsWidgetState extends State<TopNewsWidget> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(ImageManagers.news1),
              PositionedDirectional(
                top: 25.sp,
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
                      color: isSelected
                          ? ColorsManagers.red
                          : ColorsManagers.white,
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
                "العربيه",
                style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
              ),
              Spacer(),
              Container(
                height: 25.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: ColorsManagers.red,
                  borderRadius: BorderRadius.circular(60.r),
                ),
                child: Center(child: Text("الان", style: textTheme.bodySmall)),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "السيسي عن إيران: نبذل جهدا كبيرا لخفض التصعيد",
            style: textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          Text("منذ دقيقتين", style: textTheme.bodySmall),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
