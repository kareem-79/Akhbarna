import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/enlargable_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/utils/validation.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../../l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _imagePath;
  var formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
    _imagePath = PrefsManager.getProfileImage();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
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
                          imagePath: _imagePath,
                          isEditable: true,
                          onImagePicked: (newPath) async {
                            await PrefsManager.saveProfileImage(newPath);
                            setState(() {
                              _imagePath = newPath;
                            });
                          },
                        ),
                        Positioned(
                          right: 10.sp,
                          bottom: 0,
                          child: SvgPicture.asset(
                            IconManagers.edit,
                            width: 30.w,
                            color: shadowColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomTextFormFiled(
                    label: appLocalizations.name,
                    controller: nameController,
                    prefixIcon: Icons.person_2_outlined,
                    suffixIcon: Icon(Icons.edit_outlined),
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return appLocalizations.name_required;
                      }
                      if (input.trim().length < 6) {
                        return appLocalizations.name_min;
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFiled(
                    label: appLocalizations.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: Icon(Icons.edit_outlined),
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return appLocalizations.email_required;
                      }
                      if (!Validation.isValidateEmail(input)) {
                        return appLocalizations.email_invalid;
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFiled(
                    label: appLocalizations.location,
                    controller: locationController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.email_outlined,
                    suffixIcon: Icon(Icons.edit_outlined),
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return appLocalizations.location_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50.h),
                  CustomButtomNavigationBar(
                    onPress: () => _saveProfile(appLocalizations, context),
                    text: appLocalizations.save_changes,
                    backgroundColor: ColorsManagers.red,
                    foregroundColor: ColorsManagers.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveProfile(
    AppLocalizations appLocalizations,
    BuildContext context,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      if (_imagePath != null) {
        await PrefsManager.saveProfileImage(_imagePath!);
      }
      Navigator.pop(context, _imagePath);
      UiUtils.showToast(
        context,
        appLocalizations.profile_updated_success,
        ColorsManagers.vividTangerine,
      );
    }
  }
}
