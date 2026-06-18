import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BreakingNewsLoadingWidget extends StatelessWidget {
  final PageController pageController;

  const BreakingNewsLoadingWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.h,
        child: Skeletonizer(
          child: PageView.builder(
            controller: pageController,
            padEnds: false,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Theme.of(context).cardColor,
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Column(
                      children: [
                        Bone(
                          width: double.infinity,
                          height: 90.h,
                          borderRadius: BorderRadius.circular(0),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Bone(
                                  width: 60.w,
                                  height: 24.h,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),

                                SizedBox(height: 10.h),

                                Bone.text(
                                  words: 4,
                                  fontSize: 14.sp,
                                ),

                                SizedBox(height: 6.h),

                                Bone.text(
                                  words: 3,
                                  fontSize: 14.sp,
                                ),

                                const Spacer(),

                                Bone(
                                  width: 50.w,
                                  height: 12.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
