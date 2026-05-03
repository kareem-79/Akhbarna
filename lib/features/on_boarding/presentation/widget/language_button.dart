import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../provider/config_provider.dart';

class LanguageButton extends StatelessWidget {
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  const LanguageButton({super.key, this.style, this.padding, this.decoration});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigProvider>();
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: ColorsManagers.red.withOpacity(0.3),
          width: 2.w,
        ),
      ),
      child: TextButton(
        onPressed: () {
          if (config.currentLanguageCode == 'en') {
            config.changeLanguageByCode('ar');
          } else {
            config.changeLanguageByCode('en');
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          config.currentLanguageCode == 'ar'
              ? appLocalizations.lang_english
              : appLocalizations.lang_arabic,
          style: textTheme.labelSmall,
        ),
      ),
    );
  }
}
