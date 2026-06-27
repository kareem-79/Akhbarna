import 'dart:io';
import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/enlargable_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/prefs_manager/location_prefs_manager.dart';
import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/utils/validation.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../data/models/update_profile_response_model.dart';
import '../../../cubit/update_profile_cubit.dart';
import '../../../cubit/update_profile_state.dart';

class EditProfile extends StatefulWidget {
  final UpdateProfileResponse profile;

  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  String? _imagePath;
  var formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.profile.name);
    emailController = TextEditingController(text: widget.profile.email);
    locationController = TextEditingController();

    _imagePath = widget.profile.profileImageUrl;

    _loadCountry();
  }

  Future<void> _loadCountry() async {
    final country = await LocationPrefsService.getSelectedCountry();

    if (!mounted) return;

    locationController.text = country ?? "";
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

    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) async {
        if (state is GetProfileSuccess) {
          nameController.text = state.profile.name;
          emailController.text = state.profile.email;

          if (mounted) {
            setState(() {
              _imagePath = state.profile.profileImageUrl;
            });
          }
        }

        if (state is UpdateProfileSuccess) {
          Navigator.pop(context, true);

          UiUtils.showToast(
            context,
            appLocalizations.profile_updated_success,
            Colors.green,
          );
        }

        if (state is UpdateProfileError) {
          UiUtils.showToast(context, state.message, ColorsManagers.red);
        }
      },
      builder: (context, state) {
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
                              onImagePicked: (newPath) {
                                setState(() {
                                  _imagePath = newPath;
                                  _image = File(newPath);
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButtomNavigationBar(
                            onPress: () =>
                                _saveProfile(appLocalizations, context),

                            isLoading:
                                state is UpdateProfileLoading &&
                                nameController.text.isNotEmpty,
                            text: appLocalizations.save_changes,
                            backgroundColor: ColorsManagers.red,
                            foregroundColor: ColorsManagers.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _saveProfile(
    AppLocalizations appLocalizations,
    BuildContext context,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      await LocationPrefsService.saveSelectedCountry(locationController.text);

      context.read<UpdateProfileCubit>().updateProfile(
        name: nameController.text,
        email: emailController.text,
        image: _image,
      );
    }
  }
}
