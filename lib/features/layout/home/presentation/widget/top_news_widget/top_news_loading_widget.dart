import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopNewsLoadingWidget extends StatelessWidget {
  const TopNewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: 4.h),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withOpacity(.08),
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Bone(
                        width: 105.w,
                        height: 80.h,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bone(
                            width: 55.w,
                            height: 24.h,
                            borderRadius: BorderRadius.circular(8.r),
                          ),

                          SizedBox(height: 8.h),

                          Bone(
                            width: double.infinity,
                            height: 14.h,
                            borderRadius: BorderRadius.circular(4.r),
                          ),

                          SizedBox(height: 6.h),

                          Bone(
                            width: 90.w,
                            height: 14.h,
                            borderRadius: BorderRadius.circular(4.r),
                          ),

                          SizedBox(height: 10.h),

                          Row(
                            children: [
                              Bone(
                                width: 85.w,
                                height: 12.h,
                                borderRadius: BorderRadius.circular(4.r),
                              ),

                              SizedBox(width: 6.w),

                              Bone.circle(size: 3.sp),

                              SizedBox(width: 6.w),

                              Bone(
                                width: 60.w,
                                height: 12.h,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              PositionedDirectional(
                end: 5.w,
                bottom: 8.h,
                child: Bone.circle(size: 32.sp),
              ),

              PositionedDirectional(
                end: 40.w,
                bottom: 8.h,
                child: Bone.circle(size: 32.sp),
              ),
            ],
          ),
        );
      },
    );
  }
}