import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../l10n/app_localizations.dart';

class AboutHeaderWidget extends StatelessWidget {
  const AboutHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 10.sp),
        child: AppBarWidget(
          title: appLocalizations.about_app_title,
          height: 30,
          color: shadowColor,
        ),
      ),
    );
  }
}
