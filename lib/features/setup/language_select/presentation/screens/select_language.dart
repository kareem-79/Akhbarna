import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../model/language_model.dart';
import '../../../../../provider/config_provider.dart';
import '../widget/language_tile_widget.dart';

class SelectLanguage extends StatefulWidget {
  final bool isFromEdit;

  const SelectLanguage({super.key, this.isFromEdit = false});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final config = Provider.of<ConfigProvider>(context, listen: false);
      final index = AppLanguage.languages.indexWhere(
        (lang) => lang.locale == config.currentLocale,
      );
      if (index != -1) {
        setState(() {
          selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    final shadowColor = Theme.of(context).shadowColor;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(
                  title: appLocalizations.choose_language,
                  height: 30,
                  color: shadowColor,
                ),
                Text(
                  appLocalizations.fav_language,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorsManagers.lightGray,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  appLocalizations.selected,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                LanguageTile(
                  lang: AppLanguage.languages[selectedIndex],
                  isSelected: true,
                  onTap: () {},
                ),
                SizedBox(height: 24.h),
                Text(
                  appLocalizations.all_languages,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppLanguage.languages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return LanguageTile(
                      lang: AppLanguage.languages[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        config.changeLanguage(
                          AppLanguage.languages[index].locale,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        onPress: () {
          if (widget.isFromEdit) {
            Navigator.pop(context);
          } else {
            Navigator.pushNamed(context, RoutesManager.selectCategory);
          }
        },
        text: appLocalizations.step_continue,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
