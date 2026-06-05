import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MostReadLoadingWidget extends StatelessWidget {
  const MostReadLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,

      itemCount: 6,

      separatorBuilder: (_, __) => SizedBox(height: 10.h),

      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,

          child: Container(
            height: 150.h,

            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,

              borderRadius: BorderRadius.circular(30.r),
            ),

            child: Padding(
              padding: EdgeInsets.all(16.sp),

              child: Row(
                children: [
                  Bone.square(
                    size: 100.sp,

                    borderRadius: BorderRadius.circular(30.r),
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Bone.text(words: 4),

                        SizedBox(height: 10.h),

                        Bone.text(words: 3),

                        SizedBox(height: 20.h),

                        Row(
                          children: [
                            Bone.circle(size: 30.sp),

                            SizedBox(width: 10.w),

                            Expanded(child: Bone.text(words: 2)),

                            Bone.icon(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
