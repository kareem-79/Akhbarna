import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/location_model.dart';

class LocationTile extends StatelessWidget {
  final LocationModel location;
  final bool isSelected;
  final VoidCallback onTap;

  const LocationTile({
    super.key,
    required this.location,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManagers.white.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected
                ? ColorsManagers.blue
                : ColorsManagers.white.withOpacity(0.1),
            width: 1.5,
          ),
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          children: [
            Text(
              location.flag,
              style: TextStyle(fontSize: 28.sp),
            ),
            SizedBox(width: 15.w),
            Text(
              location.name,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: ColorsManagers.blue,
                size: 22.sp,
              ),
          ],
        ),
      ),
    );
  }
}