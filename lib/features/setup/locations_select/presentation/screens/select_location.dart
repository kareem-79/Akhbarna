import 'package:akhbarna/features/setup/locations_select/presentation/widget/image_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
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
                 AppBarWidget(title: "اختر بلدك", height: 10,color:ColorsManagers.white),
                ImageLocationWidget(),
                const CustomTextFormFiled(
                  label: "ابحث عن بلدك",
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
          if (selectedIndex != -1) {
            Navigator.pushNamed(context, RoutesManager.selectLanguage);
          }
        },
        text: "التالي",
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
