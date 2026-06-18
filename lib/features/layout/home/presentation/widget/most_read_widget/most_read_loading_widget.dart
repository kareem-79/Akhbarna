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
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.fromLTRB(
                  12.w,
                  12.h,
                  12.w,
                  44.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(.05),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bone.square(
                      size: 80.sp,
                      borderRadius: BorderRadius.circular(14.r),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Bone.circle(size: 6.sp),

                              SizedBox(width: 6.w),

                              Bone.text(
                                words: 1,
                                fontSize: 12.sp,
                              ),

                              SizedBox(width: 6.w),

                              Bone.circle(size: 3.sp),

                              SizedBox(width: 6.w),

                              Expanded(
                                child: Bone.text(
                                  words: 2,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          Bone.text(
                            words: 8,
                            fontSize: 14.sp,
                          ),

                          SizedBox(height: 6.h),

                          Bone.text(
                            words: 6,
                            fontSize: 14.sp,
                          ),

                          SizedBox(height: 12.h),

                          Row(
                            children: [
                              Bone.text(
                                words: 3,
                                fontSize: 12.sp,
                              ),

                              SizedBox(width: 6.w),

                              Bone.circle(size: 3.sp),

                              SizedBox(width: 6.w),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Bone(
                                    width: 70.w,
                                    height: 12.h,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ),

                              SizedBox(width: 4.w),

                              Bone.icon(size: 12.sp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              PositionedDirectional(
                end: 8.w,
                bottom: 20.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Bone.circle(size: 32.sp),

                    SizedBox(width: 8.w),

                    Bone.circle(size: 32.sp),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}