import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onViewAll;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.actionText,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: Text(
              actionText ?? appLocalizations.view_all,
              style: textTheme.bodySmall?.copyWith(
                color: ColorsManagers.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}