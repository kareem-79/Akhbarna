import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              Bone.circle(size: 120.w),

              SizedBox(height: 16.h),

              Bone.text(words: 2, fontSize: 22.sp),

              SizedBox(height: 8.h),

              Bone.text(words: 3, fontSize: 16.sp),

              SizedBox(height: 40.h),

              ...List.generate(
                6,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      children: [
                        Bone.circle(size: 45.w),

                        SizedBox(width: 16.w),

                        Expanded(child: Bone.text(words: 2, fontSize: 16.sp)),

                        Bone.icon(size: 22.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
