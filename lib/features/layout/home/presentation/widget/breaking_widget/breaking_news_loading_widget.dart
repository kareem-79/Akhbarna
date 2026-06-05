import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BreakingNewsLoadingWidget extends StatelessWidget {
  final PageController pageController;

  const BreakingNewsLoadingWidget({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220.h,

        child: Skeletonizer.zone(
          child: PageView.builder(
            controller: pageController,

            itemCount: 3,

            itemBuilder: (context, index) {
              return Container(
                width: 330.w,
                height: 200.h,

                margin: EdgeInsets.symmetric(horizontal: 4.w),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),

                  color: Theme.of(context).cardColor.withOpacity(.25),
                ),

                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.r),

                        child: Bone.square(size: double.infinity),
                      ),
                    ),

                    PositionedDirectional(
                      top: 15.h,
                      start: 15.w,

                      child: Bone.circle(size: 40.sp),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,

                      child: Container(
                        width: double.infinity,

                        padding: EdgeInsets.all(12.sp),

                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.35),

                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),

                            bottomRight: Radius.circular(30.r),
                          ),
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [
                            Row(
                              children: [
                                Bone.circle(size: 30.sp),

                                SizedBox(width: 8.w),

                                Expanded(child: Bone.text(words: 2)),

                                SizedBox(
                                  width: 50.w,
                                  child: Bone.text(words: 1),
                                ),
                              ],
                            ),

                            SizedBox(height: 12.h),

                            Bone.text(words: 6),

                            SizedBox(height: 8.h),

                            Bone.text(words: 4),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
