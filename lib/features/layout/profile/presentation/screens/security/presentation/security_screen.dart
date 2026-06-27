import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/core/widget/custom_text_button.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/security/widget/security_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/routes_managers.dart';
import '../../../../../../../core/utils/validation.dart';
import '../../../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../auth/forget_password/presentation/cubit/change_password_cubit.dart';
import '../../../../../../auth/forget_password/presentation/cubit/state/change_password_state.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  late bool secure = true;
  late bool confirmSecure = true;
  var formKey = GlobalKey<FormState>();
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Navigator.pop(context);

          UiUtils.showToast(
            context,
            appLocalizations.password_changed,
            ColorsManagers.riverBed,
          );
        }

        if (state is ChangePasswordError) {
          UiUtils.showToast(context, state.message, ColorsManagers.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SecurityHeaderWidget(),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            appLocalizations.change_password,
                            style: textTheme.bodyLarge?.copyWith(
                              color: ColorsManagers.red,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            appLocalizations.password_rule2,
                            style: textTheme.bodySmall,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormFiled(
                            label: appLocalizations.current_password,
                            controller: currentPasswordController,
                            secure: true,
                            prefixIcon: Icons.lock_outline,
                            validator: (input) {
                              if (input == null || input.trim().isEmpty) {
                                return appLocalizations.password_required;
                              }

                              if (!Validation.isValidatePassword(input)) {
                                return appLocalizations.password_rule;
                              }

                              return null;
                            },
                          ),
                          CustomTextFormFiled(
                            label: appLocalizations.new_password,
                            controller: newPasswordController,
                            validator: (input) {
                              if (input == null || input.trim().isEmpty) {
                                return appLocalizations.password_required;
                              }
                              if (!Validation.isValidatePassword(input)) {
                                return appLocalizations.password_rule;
                              }
                              return null;
                            },
                            secure: secure,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: IconButton(
                              onPressed: () {
                                secure = !secure;
                                setState(() {});
                              },
                              icon: Icon(
                                secure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          CustomTextFormFiled(
                            label: appLocalizations.confirm_new_password,
                            controller: confirmPasswordController,
                            validator: (input) {
                              if (input == null || input.trim().isEmpty) {
                                return appLocalizations.password_required;
                              }

                              if (!Validation.isPasswordMatch(
                                newPasswordController.text,
                                input,
                              )) {
                                return appLocalizations.passwords_not_match;
                              }

                              return null;
                            },
                            secure: confirmSecure,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: IconButton(
                              onPressed: () {
                                confirmSecure = !confirmSecure;
                                setState(() {});
                              },
                              icon: Icon(
                                confirmSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          CustomTextButton(
                            onPress: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.forgetPassword,
                                arguments: true,
                              );
                            },
                            text: appLocalizations.forgot_password,
                            color: ColorsManagers.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomButtomNavigationBar(
            onPress: () => _changePassword(appLocalizations, context),
            text: appLocalizations.change_password,
            backgroundColor: ColorsManagers.red,
            foregroundColor: ColorsManagers.white,
          ),
        );
      },
    );
  }

  Future<void> _changePassword(
    AppLocalizations appLocalizations,
    BuildContext context,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      context.read<ChangePasswordCubit>().changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
    }
  }
}
