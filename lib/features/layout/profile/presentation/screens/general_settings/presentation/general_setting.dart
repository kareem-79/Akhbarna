import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/general_settings/widget/setting_row_widget.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/general_settings/widget/text_size_option_widget.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/settings_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/prefs_manager/source_prefs_manager.dart';
import '../../../../../../../core/utils/font_size.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../model/source_model.dart';
import '../../../../../../../provider/config_provider.dart';
import '../widget/source_switch_tile.dart';
import '../widget/theme_selector.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  @override
  void initState() {
    super.initState();
    loadSavedSources();
  }

  Future<void> loadSavedSources() async {
    final saved =
    await SourcePrefsService.getSelectedSources();

    setState(() {
      for (var source in SourceModel.sources) {
        source.isSelected =
            saved.contains(source.name);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color shadowColor = Theme.of(context).shadowColor;
    return Consumer<ConfigProvider>(
      builder: (context, config, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(
                    title: appLocalizations.edit_profile,
                    height: 30,
                    color: shadowColor,
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    appLocalizations.appearance,
                    style: textTheme.bodySmall?.copyWith(color: ColorsManagers.gray3),
                  ),
                  SizedBox(height: 12.h),
                  SettingsSectionWidget(
                    padding: EdgeInsets.all(16.sp),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appLocalizations.theme_mode,
                                  style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  appLocalizations.choose_theme,
                                  maxLines: 1,
                                  style: textTheme.labelSmall?.copyWith(
                                    color: ColorsManagers.gray3,

                                  ),
                                ),
                              ],
                            ),
                          ),
                          ThemeSelector(
                            isDark: config.currentTheme == ThemeMode.dark,
                            onChanged: (isDark) {
                              config.changeAppTheme(
                                isDark ? ThemeMode.dark : ThemeMode.light,
                              );
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 32.h,
                        color: shadowColor.withOpacity(.1),
                      ),
                      SettingRowWidget(
                        title: appLocalizations.automatic,
                        subtitle: appLocalizations.system_default,
                        value: config.isSystemFont,
                        onChanged: (val) {
                          config.setSystemFont(val);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    appLocalizations.font_size,
                    style: textTheme.bodySmall?.copyWith(color: ColorsManagers.gray3),
                  ),
                  SizedBox(height: 12.h),
                  SettingsSectionWidget(
                    padding: EdgeInsets.all(16.sp),
                    children: [
                      TextSizeOptionWidget(size: FontSize.small),
                      TextSizeOptionWidget(size: FontSize.medium),
                      TextSizeOptionWidget(size: FontSize.large),
                      TextSizeOptionWidget(
                        size: FontSize.extraLarge,
                        isLast: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    appLocalizations.sources,
                    style: textTheme.bodySmall?.copyWith(color: ColorsManagers.gray3),
                  ),
                  SizedBox(height: 12.h),
                  SettingsSectionWidget(
                    padding: EdgeInsets.all(16.sp),
                    children: [
                      ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: SourceModel.sources.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 20.h,
                        color: shadowColor.withOpacity(.1),
                      ),
                      itemBuilder: (context, index) {
                        final source = SourceModel.sources[index];

                        return SourceSwitchTile(
                          source: source,
                          onChanged: (value) async {
                            setState(() {
                              source.isSelected = value;
                            });
                            final selectedNames = SourceModel.sources
                                .where((e) => e.isSelected)
                                .map((e) => e.name)
                                .toList();
                            await SourcePrefsService.saveSelectedSources(
                              selectedNames,
                            );
                          },
                        );
                      },
                    ),],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}