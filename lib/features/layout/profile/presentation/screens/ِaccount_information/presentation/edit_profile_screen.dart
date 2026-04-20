import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/enlargable_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/resources/routes_managers.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../../l10n/app_localizations.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
                  title: appLocalizations.edit_profile,
                  height: 30,
                  color: shadowColor,
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: 150.w,
                  height: 150.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      EnlargableProfileAvatar(
                        imageUrl: "https://i.pravatar.cc/300",
                      ),
                      Positioned(
                        right: 10.sp,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(IconManagers.edit, width: 30.w),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                CustomTextFormFiled(
                  label: appLocalizations.name,
                  prefixIcon: Icons.person_2_outlined,
                  suffixIcon: Image(image: AssetImage(IconManagers.editPng)),
                ),
                CustomTextFormFiled(
                  label: appLocalizations.email,
                  prefixIcon: Icons.email_outlined,
                  suffixIcon: Image(image: AssetImage(IconManagers.editPng)),
                ),
                CustomTextFormFiled(
                  label: appLocalizations.location,
                  prefixIcon: Icons.location_on_outlined,
                  suffixIcon: Image(image: AssetImage(IconManagers.editPng)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        onPress: () {
          Navigator.pushNamed(context, RoutesManager.profile);
        },
        text: appLocalizations.save_changes,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
