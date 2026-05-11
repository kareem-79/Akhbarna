import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/core/widget/custom_buttom_navigation_bar.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/prefs_manager/category_prefs_manager.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../model/category_model.dart';
import '../widget/category_grid_widget.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  void initState() {
    super.initState();
    loadSavedCategories();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                AppBarWidget(
                  title: appLocalizations.choose_interests,
                  height: 30,
                  color: shadowColor,
                ),
                Text(
                  appLocalizations.choose_interests_desc,
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                CategoryGridWidget(
                  categories: CategoryModel.categories,
                  onTap: toggleCategory,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: CustomButtomNavigationBar(
        onPress: onNext,
        text: appLocalizations.next,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }

  void toggleCategory(int index) async {
    setState(() {
      CategoryModel.categories[index].isSelected =
          !CategoryModel.categories[index].isSelected;
    });

    final selectedNames = CategoryModel.categories
        .where((e) => e.isSelected)
        .map((e) => e.name)
        .toList();

    await CategoryPrefsService.saveSelectedCategories(selectedNames);
  }

  void onNext() {
    final selected = CategoryModel.categories.where((e) => e.isSelected).length;

    if (selected < 3) {
      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!.select_min_3_interests,
        ColorsManagers.vividTangerine,
      );
      return;
    }
    Navigator.pushNamed(context, RoutesManager.start);
  }

  void loadSavedCategories() async {
    final saved = await CategoryPrefsService.getSelectedCategories();

    setState(() {
      for (var category in CategoryModel.categories) {
        category.isSelected = saved.contains(category.name);
      }
    });
  }
}
