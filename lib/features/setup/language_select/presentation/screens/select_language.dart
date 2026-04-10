import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../model/language_model.dart';
import '../widget/language_tile_widget.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int selectedIndex = 0;

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(
                  title: "اختر اللغة",
                  height: 30,
                  color: ColorsManagers.white,
                ),
                Text(
                  "حدد لغتك المفضلة أدناه. هذا يساعدنا على خدمتك بشكل أفضل.",
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorsManagers.lightGray,
                  ),
                ),

                SizedBox(height: 30.h),

                Text(
                  "لقد اخترت",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12.h),
                LanguageTile(
                  lang: LanguageModel.languages[selectedIndex],
                  isSelected: true,
                  onTap: () {},
                ),
                SizedBox(height: 24.h),
                Text(
                  "جميع اللغات",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: LanguageModel.languages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return LanguageTile(
                      lang: LanguageModel.languages[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
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
          Navigator.pushNamed(context, RoutesManager.selectSources);
        },
        text: "متابعة",
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
