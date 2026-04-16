import 'package:akhbarna/features/setup/locations_select/presentation/widget/image_location_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../features/setup/locations_select/presentation/widget/location_tile.dart';
import '../../../../../model/location_model.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(
                  title: appLocalizations.choose_country,
                  height: 10,
                  color: shadowColor,
                ),
                ImageLocationWidget(),
                 CustomTextFormFiled(
                  label: appLocalizations.search_country,
                  suffixIcon: Icon(Icons.search_rounded),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: LocationModel.locations.length,
                  itemBuilder: (context, index) {
                    final location = LocationModel.locations[index];
                    final isSelected = selectedIndex == index;
                    return LocationTile(
                      location: location,
                      isSelected: isSelected,
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
          if (selectedIndex == -1) {
            UiUtils.showToast(
              context,
              appLocalizations.please_select_country,
              ColorsManagers.red,
            );
            return;
          }
          Navigator.pushNamed(context, RoutesManager.selectLanguage);
        },
        text: appLocalizations.next,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
