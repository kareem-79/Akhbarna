import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final Color bg = Theme.of(context).scaffoldBackgroundColor;
    final Color cardColor = Theme.of(context).cardColor;
    final TextTheme textTheme = Theme.of(context).textTheme;
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
              title: appLocalizations.light_mode,
              icon: Icons.wb_sunny_outlined,
              selected: !isDark,
              onTap: () => onChanged(false),
              cardColor: cardColor,
              color: Colors.yellow,
              textTheme: textTheme,
            ),
          ),
          Expanded(
            child: _item(
              title: appLocalizations.dark,
              icon: Icons.nightlight_round,
              selected: isDark,
              onTap: () => onChanged(true),
              cardColor: cardColor,
              color: ColorsManagers.blue,
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
    required Color color,
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
            Icon(icon, size: 16.sp, color: color),
            SizedBox(width: 4.w),
            Text(title, style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
