import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';


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
          Icon(
            icon,
            color: Colors.white70,
            size: 35.sp,
          ),
          SizedBox(width: 12.w),
        ],
        Expanded(
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 20.sp
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: ColorsManagers.blue,
        ),
      ],
    );
  }
}