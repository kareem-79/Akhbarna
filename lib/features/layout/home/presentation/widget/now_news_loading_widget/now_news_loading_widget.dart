import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowNewsLoadingWidget extends StatelessWidget {
  const NowNewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Bone(
                  width: double.infinity,
                  height: 220.h,
                  borderRadius: BorderRadius.circular(14.r),
                ),

                PositionedDirectional(
                  top: 20.sp,
                  start: 20.sp,
                  child: Bone.circle(
                    size: 48.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Row(
              children: [
                Bone.circle(
                  size: 60.sp,
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Bone(
                    height: 18.h,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),

                SizedBox(width: 12.w),

                Bone(
                  width: 60.w,
                  height: 28.h,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Bone.text(
              words: 8,
              fontSize: 18.sp,
            ),

            SizedBox(height: 8.h),

            Bone.text(
              words: 6,
              fontSize: 18.sp,
            ),

            SizedBox(height: 12.h),

            Align(
              alignment: Alignment.centerRight,
              child: Bone(
                width: 100.w,
                height: 14.h,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}