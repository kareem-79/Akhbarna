import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/about/widget/about_header_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AboutHeaderWidget(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _card(textTheme, appLocalizations.about_app_description),
                    _card(textTheme, appLocalizations.about_app_coverage),
                    _card(textTheme, appLocalizations.about_app_experience),

                    _section(textTheme, appLocalizations.our_goal),
                    _card(textTheme, appLocalizations.goal_1),
                    _card(textTheme, appLocalizations.goal_2),
                    _card(textTheme, appLocalizations.goal_3),
                    _card(textTheme, appLocalizations.goal_4),

                    _section(textTheme, appLocalizations.app_features),
                    _card(textTheme, appLocalizations.feature_1),
                    _card(textTheme, appLocalizations.feature_2),
                    _card(textTheme, appLocalizations.feature_3),
                    _card(textTheme, appLocalizations.feature_4),
                    _card(textTheme, appLocalizations.feature_5),

                    _section(textTheme, appLocalizations.our_vision),
                    _card(textTheme, appLocalizations.vision_description),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(TextTheme textTheme, String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorsManagers.darkNavy,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManagers.dark),
      ),
      child: Text(
        text,
        style: textTheme.bodyMedium,
      ),
    );
  }

  Widget _section(TextTheme textTheme, String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorsManagers.darkNavy,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManagers.vividTangerine),
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}