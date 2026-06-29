import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/core/widget/custom_buttom_navigation_bar.dart';
import 'package:akhbarna/features/setup/sources_select/presentation/widget/source_grid_widget.dart';
import 'package:akhbarna/model/source_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/prefs_manager/source_prefs_manager.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';

class SelectSources extends StatefulWidget {
  final bool isFromEdit;

  const SelectSources({super.key, this.isFromEdit = false});

  @override
  State<SelectSources> createState() => _SelectSourcesState();
}

class _SelectSourcesState extends State<SelectSources> {
  @override
  void initState() {
    super.initState();
    loadSavedSources();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color shadowColor = Theme.of(context).shadowColor;

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
                  title: appLocalizations.choose_sources,
                  height: 30,
                  color: shadowColor,
                ),
                CustomTextFormFiled(
                  label: appLocalizations.search_sources,
                  suffixIcon: const Icon(Icons.search_rounded),
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
        onPress: () => onNext(appLocalizations),
        text: appLocalizations.next,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }

  void toggleSources(int index) async {
    setState(() {
      SourceModel.sources[index].isSelected =
          !SourceModel.sources[index].isSelected;
    });

    final selectedNames = SourceModel.sources
        .where((e) => e.isSelected)
        .map((e) => e.name)
        .toList();

    await SourcePrefsService.saveSelectedSources(selectedNames);
  }

  void onNext(AppLocalizations appLocalizations) {
    final selected = SourceModel.sources.where((e) => e.isSelected).length;

    if (selected < 1) {
      UiUtils.showToast(
        context,
        appLocalizations.select_min_interests,
        ColorsManagers.vividTangerine,
      );
      return;
    }
    if (widget.isFromEdit) {
      Navigator.pop(context);
    } else {
      Navigator.pushNamed(context, RoutesManager.start);
    }
  }

  void loadSavedSources() async {
    final saved = await SourcePrefsService.getSelectedSources();
    setState(() {
      for (var source in SourceModel.sources) {
        source.isSelected = saved.contains(source.name);
      }
    });
  }
}
