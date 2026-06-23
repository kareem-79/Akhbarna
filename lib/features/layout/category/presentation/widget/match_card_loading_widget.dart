import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MatchCardLoadingWidget extends StatelessWidget {
  const MatchCardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color canvasColor = Theme.of(context).canvasColor;

    return Skeletonizer(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            margin: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  canvasColor,
                  bgColor,
                ],
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              children: [
                Bone(
                  width: 80.w,
                  height: 24.h,
                  borderRadius: BorderRadius.circular(20.r),
                ),

                SizedBox(height: 12.h),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Bone.circle(size: 30.w),

                          SizedBox(height: 10.h),

                          Bone(
                            width: 60.w,
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Bone(
                        width: 70.w,
                        height: 30.h,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Bone.circle(size: 30.w),

                          SizedBox(height: 10.h),

                          Bone(
                            width: 60.w,
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 8.h),
      ),
    );
  }
}