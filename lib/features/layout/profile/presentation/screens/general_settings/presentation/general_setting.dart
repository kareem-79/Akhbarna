import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/general_settings/widget/setting_row_widget.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/general_settings/widget/text_size_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/font_size.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../provider/config_provider.dart';

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color shadowColor = Theme.of(context).shadowColor;
    return Consumer<ConfigProvider>(
      builder: (context, config, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppBarWidget(
                    title: appLocalizations.edit_profile,
                    height: 30,
                    color: shadowColor,
                  ),
                  SizedBox(height: 50.h),
                  SettingRowWidget(
                    title: appLocalizations.light_mode,
                    value: config.currentTheme == ThemeMode.light,
                    onChanged: (bool isLight) {
                      config.changeAppTheme(
                        isLight ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    icon: Icons.light_mode,
                  ),

                  SizedBox(height: 16.h),

                  SettingRowWidget(
                    title: appLocalizations.auto_device,
                    value: config.isSystemFont,
                    onChanged: (val) {
                      config.setSystemFont(val);
                    },
                    icon: Icons.text_fields,
                  ),

                  Divider(
                    color: Colors.grey[800],
                    height: 40.h,
                  ),

                  Row(
                    children: [
                      Image.asset(
                        IconManagers.fontStyle,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        appLocalizations.font_size,
                        style: textTheme.bodySmall
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  TextSizeOptionWidget(
                    size: FontSize.small,
                  ),

                  TextSizeOptionWidget(
                    size: FontSize.medium,
                  ),

                  TextSizeOptionWidget(
                    size: FontSize.large,
                  ),

                  TextSizeOptionWidget(
                    size: FontSize.extraLarge,
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                top: 10.h,
              ),
              child: CustomElevatedButton(
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.selectSources,
                    arguments: true,
                  );
                },
                text: appLocalizations.change_sources,
                foregroundColor: ColorsManagers.white,
                backgroundColor: ColorsManagers.red,
              ),
            ),
          ),
        );
      },
    );
  }
}