import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryLoadingWidget extends StatelessWidget {
  const CategoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.sp),
      itemCount: 8,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final isOddIndex = index.isOdd;

        return Skeletonizer(
          enabled: true,
          child: Container(
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                Bone(
                  width: double.infinity,
                  height: 110.h,
                  borderRadius: BorderRadius.circular(20.r),
                ),

                Positioned(
                  top: 0,
                  bottom: 0,
                  left: isOddIndex ? null : 20.w,
                  right: isOddIndex ? 20.w : null,
                  child: Center(child: Bone.icon(size: 28.sp)),
                ),

                Positioned(
                  top: 0,
                  bottom: 0,
                  left: isOddIndex ? null : 60.w,
                  right: isOddIndex ? 60.w : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isOddIndex
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Bone.text(words: 2, fontSize: 18.sp),

                      SizedBox(height: 8.h),

                      Bone.text(words: 3, fontSize: 14.sp),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 12.w,
                  right: 12.w,
                  child: Bone(
                    height: 5.h,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
