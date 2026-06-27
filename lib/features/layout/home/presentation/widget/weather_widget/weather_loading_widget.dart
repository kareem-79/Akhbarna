import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final canvasColor = Theme.of(context).canvasColor;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Skeletonizer(
      enabled: true,
      child: Container(
        constraints: BoxConstraints(minHeight: 140.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [canvasColor, bgColor],
          ),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.white.withOpacity(.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Bone(
                  width: 50.w,
                  height: 22.h,
                  borderRadius: BorderRadius.circular(16.r),
                ),

                const Spacer(),

                Bone(
                  width: 120.w,
                  height: 14.h,
                  borderRadius: BorderRadius.circular(8.r),
                ),

                SizedBox(width: 6.w),

                Bone.circle(size: 14.sp),
              ],
            ),

            SizedBox(height: 10.h),

            /// Temperature + Icon
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bone.text(words: 1, fontSize: 38.sp),

                      SizedBox(height: 6.h),

                      Bone.text(words: 2, fontSize: 16.sp),
                    ],
                  ),
                ),

                Bone.circle(size: 70.sp),
              ],
            ),

            SizedBox(height: 14.h),

            Wrap(
              spacing: 6.w,
              runSpacing: 6.h,
              children: List.generate(
                3,
                (_) => Bone(
                  width: 70.w,
                  height: 28.h,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
