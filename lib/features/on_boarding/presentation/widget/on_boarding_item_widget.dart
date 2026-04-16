import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/routes_managers.dart';
import 'OnBoardingWidget.dart';

class OnBoardingItemWidget extends StatelessWidget {
  final OnBoardingWidget model;
  final int currentIndex;
  final int total;
  final PageController controller;

  const OnBoardingItemWidget({
    super.key,
    required this.model,
    required this.currentIndex,
    required this.total,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Image.asset(
          model.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 40.sp,
          right: 20.sp,
          left: 20.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
              ),
              Text(
                model.description,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  color: ColorsManagers.red,
                ),
              ),
              SizedBox(height: 80.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      total,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: currentIndex == index ? 20 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.red
                              : Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (currentIndex < total - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.startUp,
                        );
                      }
                    },
                    child: Container(
                      width: 70.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: ColorsManagers.red,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
