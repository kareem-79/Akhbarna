import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeSelector extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;

  const ThemeSelector({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = Theme
        .of(context)
        .scaffoldBackgroundColor;
    final Color cardColor = Theme
        .of(context)
        .cardColor;
    final Color shadowColor = Theme
        .of(context)
        .shadowColor;
    final TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Container(
      width: 150.w,
      height: 50.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: bg.withOpacity(.2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _item(
              title: 'فاتح',
              icon: Icons.wb_sunny_outlined,
              selected: !isDark,
              onTap: () => onChanged(false),
              cardColor: cardColor,
              shadowColor: shadowColor,
              textTheme: textTheme,
            ),
          ),
          Expanded(
            child: _item(
              title: 'داكن',
              icon: Icons.nightlight_round,
              selected: isDark,
              onTap: () => onChanged(true),
              cardColor: cardColor,
              shadowColor: shadowColor,
              textTheme: textTheme,
            ),
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
    required Color cardColor,
    required Color shadowColor,
    required TextTheme textTheme,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: selected ? cardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: shadowColor,
            ),
            SizedBox(width: 4.w),
            Text(
              title,
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
