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
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../provider/config_provider.dart';

class GeneralSettingsBottomSheet extends StatelessWidget {
  const GeneralSettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Consumer<ConfigProvider>(
      builder: (context, config, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.70.h,
          decoration: BoxDecoration(
            color: ColorsManagers.gray2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r),
              topRight: Radius.circular(60.r),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40.w,
                            height: 4.h,
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            appLocalizations.general_settings,
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorsManagers.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
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
                        Divider(color: Colors.grey[800], height: 40.h),
                        Row(
                          children: [
                            Image.asset(IconManagers.fontStyle),
                            SizedBox(width: 8.w),
                            Text(
                              appLocalizations.font_size,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        TextSizeOptionWidget(size: FontSize.small),
                        TextSizeOptionWidget(size: FontSize.medium),
                        TextSizeOptionWidget(size: FontSize.large),
                        TextSizeOptionWidget(size: FontSize.extraLarge),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            ],
          ),
        );
      },
    );
  }
}
