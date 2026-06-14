import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/model/home_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabItemWidget extends StatelessWidget {
  final HomeTabModel homeTabModel;
  final bool isSelected;

  const CustomTabItemWidget({
    super.key,
    required this.homeTabModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManagers.red : Colors.transparent,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(homeTabModel.emoji, style: TextStyle(fontSize: 14.sp)),

              SizedBox(width: 4.w),

              Text(
                homeTabModel.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
