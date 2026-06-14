import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';

class SettingsDividerWidget extends StatelessWidget {
  const SettingsDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Divider(
        height: 1,
        color: ColorsManagers.gray3.withOpacity(.15),
      ),
    );
  }
}