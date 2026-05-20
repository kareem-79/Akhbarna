import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';

class NowNewsWidget extends StatefulWidget {
  const NowNewsWidget({super.key});

  @override
  State<NowNewsWidget> createState() => _NowNewsWidgetState();
}

class _NowNewsWidgetState extends State<NowNewsWidget> {
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
                width: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManagers.red,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                      "الان",
                      style: textTheme.bodySmall
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "السيسي عن إيران: نبذل جهدا كبيرا لخفض التصعيد",
            style: textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            "منذ دقيقتين",
            style: textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
