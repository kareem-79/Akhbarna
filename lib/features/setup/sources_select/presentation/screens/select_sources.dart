import 'package:akhbarna/core/widget/custom_buttom_navigation_bar.dart';
import 'package:akhbarna/features/setup/sources_select/presentation/widget/source_grid_widget.dart';
import 'package:akhbarna/model/source_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class SelectSources extends StatefulWidget {
  const SelectSources({super.key});

  @override
  State<SelectSources> createState() => _SelectSourcesState();
}

class _SelectSourcesState extends State<SelectSources> {
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
                const AppBarWidget(title: "", height: 30),
                Text("اختر مصادر الاخبار", style: textTheme.bodyLarge),
                SizedBox(height: 10.h),
                const CustomTextFormFiled(
                  label: "ابحث عن مصدر اخباري",
                  suffixIcon: Icon(Icons.search_rounded),
                ),
                SizedBox(height: 20.h),
                SourceGridWidget(
                  sources: SourceModel.sources,
                  onTap: toggleSources,
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
  void toggleSources(int index) {
    setState(() {
      SourceModel.sources[index].isSelected =
      !SourceModel.sources[index].isSelected;
    });
  }

  void onNext() {
    final selected = SourceModel.sources.where((e) => e.isSelected).length;

    if (selected < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("اختار 1 اهتمامات على الأقل",style:Theme.of(context).textTheme.bodySmall )),
      );
      return;
    }
    Navigator.pushNamed(context, RoutesManager.start);
  }
}
