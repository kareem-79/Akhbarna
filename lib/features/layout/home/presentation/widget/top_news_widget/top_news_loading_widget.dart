import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestNewsLoadingWidget extends StatelessWidget {
  const LatestNewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 4,

      separatorBuilder: (_, __) =>
          SizedBox(height: 12.h),

      itemBuilder: (context, index) {
        return Skeletonizer.zone(
          child: Container(
            height: 300.h,

            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                25.r,
              ),

              color: Theme.of(context)
                  .cardColor,
            ),

            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(
                25.r,
              ),

              child: Column(
                children: [

                  Container(
                    width: double.infinity,

                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Row(
                          children: [

                            Bone.circle(
                              size: 40.sp,
                            ),

                            SizedBox(
                              width: 8.w,
                            ),

                            Expanded(
                              child: Bone.text(
                                words: 2,
                              ),
                            ),

                            SizedBox(
                              width: 12.w,
                            ),

                            Bone.icon(),
                          ],
                        ),

                        SizedBox(
                          height: 16.h,
                        ),

                        Bone.text(
                          words: 8,
                        ),

                        SizedBox(
                          height: 8.h,
                        ),

                        Bone.text(
                          words: 5,
                        ),

                        SizedBox(
                          height: 10.h,
                        ),

                        Align(
                          alignment:
                          Alignment
                              .centerLeft,

                          child: SizedBox(
                            width: 80.w,
                            child: Bone.text(
                              words: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      width: double.infinity,

                      margin:
                      EdgeInsets.only(
                        top: 4.h,
                      ),

                      child: Bone.square(
                        size: double.infinity,
                      ),
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