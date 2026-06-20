import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -15.w,
              top: -15.h,
              child: Bone.circle(
                size: 75.sp,
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Bone.text(
                    words: 2,
                    fontSize: 11.sp,
                  ),
                ),

                SizedBox(height: 12.h),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bone.text(
                          words: 1,
                          fontSize: 26.sp,
                        ),

                        SizedBox(height: 6.h),

                        Bone.text(
                          words: 2,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),

                    const Spacer(),

                    Bone.circle(
                      size: 40.sp,
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  children: [
                    Bone.text(
                      words: 1,
                      fontSize: 10.sp,
                    ),

                    SizedBox(width: 12.w),

                    Bone.text(
                      words: 2,
                      fontSize: 10.sp,
                    ),

                    const Spacer(),

                    Bone(
                      width: 70.w,
                      height: 24.h,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}