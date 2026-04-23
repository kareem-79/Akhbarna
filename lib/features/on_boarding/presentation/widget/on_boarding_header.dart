import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/routes_managers.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../provider/config_provider.dart';
import 'language_button.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(
        top: 12.sp,
        right: 20.sp,
        left: 20.sp,
        bottom: 10.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LanguageButton(),
          Container(
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
                Navigator.pushNamed(context, RoutesManager.startUp);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                appLocalizations.onboarding_skip,
                style: textTheme.labelSmall?.copyWith(
                  color: ColorsManagers.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
