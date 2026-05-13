import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_managers.dart';

class AuthSwitchItem extends StatelessWidget {
  const AuthSwitchItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.icon,
    required this.textTheme,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final bool isActive;
  final String text;
  final IconData icon;
  final TextTheme textTheme;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 45.h,
      decoration: BoxDecoration(
        color: isActive ? ColorsManagers.dark : Colors.transparent,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (isActive)
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: ColorsManagers.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30.sp, color: ColorsManagers.black),
            ),
          if (isActive) SizedBox(width: 8.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: Text(
              text,
              maxLines: 1,
              style: textTheme.bodySmall?.copyWith(
                color: isActive
                    ? ColorsManagers.white
                    : ColorsManagers.lightGray,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
