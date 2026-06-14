import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)
          ),
          GestureDetector(
            onTap: onViewAll,
            child: Text(
                "عرض الكل",
                style: textTheme.bodySmall?.copyWith(color: ColorsManagers.red)
            ),
          ),
        ],
      ),
    );
  }
}