import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';

class ChangePassword extends StatefulWidget {

  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late bool secure = true;
  late bool confirmSecure = true;
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppBarWidget(title: "", height: 20),
                  Image.asset(
                    ImageManagers.changePassword,
                    width: 210.w,
                    height: 210.h,
                  ),
                  Text(
                    appLocalizations.change_password,
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFiled(
                    label: appLocalizations.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
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
                    label: appLocalizations.password,
                    controller: passwordController,
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
                        secure ? Icons.visibility_off : Icons.visibility,
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
                        passwordController.text,
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
                        confirmSecure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          top: 10.h,
        ),
        child: CustomElevatedButton(
          onPress: () => _changePassword(appLocalizations, context),
          text: appLocalizations.confirm,
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }

  Future<void> _changePassword(
    AppLocalizations appLocalizations,
    BuildContext context,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesManager.login,
          (route) => false,
        );
      UiUtils.showToast(
        context,
        appLocalizations.password_changed,
        ColorsManagers.riverBed,
      );
    }
  }
}
