import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationLoadingWidget extends StatelessWidget {
  const NotificationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      itemCount: 8,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.sp),
            child: Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Bone.icon(size: 28.sp),

                          SizedBox(height: 12.h),

                          Bone.circle(size: 50.r),
                        ],
                      ),

                      SizedBox(width: 10.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),

                            Bone.text(
                              words: 6,
                              fontSize: 14.sp,
                            ),

                            SizedBox(height: 8.h),

                            Bone.text(
                              words: 4,
                              fontSize: 14.sp,
                            ),

                            SizedBox(height: 12.h),

                            Row(
                              children: [
                                Bone.icon(size: 16.sp),

                                SizedBox(width: 6.w),

                                Bone.text(
                                  words: 1,
                                  fontSize: 12.sp,
                                ),

                                const Spacer(),

                                Bone.text(
                                  words: 2,
                                  fontSize: 12.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: Bone.icon(size: 28.sp),
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