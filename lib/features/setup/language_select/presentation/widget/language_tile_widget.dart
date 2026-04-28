import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/language_model.dart';

class LanguageTile extends StatelessWidget {
  final AppLanguage lang;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageTile({
    super.key,
    required this.lang,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManagers.white.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
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
            Text(lang.flag, style: Theme.of(context).textTheme.bodyMedium),

            SizedBox(width: 12.w),

            Text(
              lang.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? ColorsManagers.blue : ColorsManagers.white,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
