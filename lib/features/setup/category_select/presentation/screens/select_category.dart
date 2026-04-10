import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
                  title: "اختر اهتماماتك",
                  height: 30,
                  color: ColorsManagers.white,
                ),
                Text(
                  "اختر المواضيع التي تحبها ودع أخبارنا يقدم لك الأخبار الأكثر أهمية. اختر 3 على الأقل",
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
        text: "التالي",
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }

  void toggleCategory(int index) {
    setState(() {
      CategoryModel.categories[index].isSelected =
          !CategoryModel.categories[index].isSelected;
    });
  }

  void onNext() {
    final selected = CategoryModel.categories.where((e) => e.isSelected).length;

    if (selected < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "اختار 3 اهتمامات على الأقل",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      return;
    }
    Navigator.pushNamed(context, RoutesManager.start);
  }
}
