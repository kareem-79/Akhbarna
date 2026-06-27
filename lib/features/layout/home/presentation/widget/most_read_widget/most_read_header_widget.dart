import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_managers.dart';
class MostReadHeaderWidget extends StatefulWidget {

  const MostReadHeaderWidget({super.key});

  @override
  State<MostReadHeaderWidget> createState() =>
      _MostReadHeaderWidgetState();
}

class _MostReadHeaderWidgetState extends State<MostReadHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      height: topPadding + 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: topPadding + 20.h,
          bottom: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ArrowBackWidget(),
            Text(
              appLocalizations.most_read,
              style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
            ),
          ],
        ),
      ),
    );
  }
}
