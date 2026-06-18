import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/colors_managers.dart';

class SettingRowWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;

  const SettingRowWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 35.sp, color: ColorsManagers.white),
          SizedBox(width: 12.w),
        ],
        Expanded(
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: ColorsManagers.blue,
          activeTrackColor: ColorsManagers.blue.withOpacity(0.4),
          inactiveThumbColor: ColorsManagers.white,
          inactiveTrackColor: Colors.grey.shade300,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManagers.blue;
            }
            return ColorsManagers.white;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManagers.blue.withOpacity(0.4);
            }
            return Colors.grey.shade300;
          }),
        ),
      ],
    );
  }
}
