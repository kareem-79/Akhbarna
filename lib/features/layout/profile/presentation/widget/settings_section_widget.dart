import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';

class SettingsSectionWidget extends StatelessWidget {
  final List<Widget> children;

  const SettingsSectionWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorsManagers.dark, ColorsManagers.darkNavy],
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}