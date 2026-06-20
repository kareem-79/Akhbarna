import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsSectionWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const SettingsSectionWidget({super.key, required this.children, this.padding});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Theme.of(context).cardColor;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(children: children),
    );
  }
}
