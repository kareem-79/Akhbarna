import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../auth_layout.dart';
import '../../../widget/custom_start_up_elevated_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool secure = true;
  var formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AuthLayout(
      title: appLocalizations.signup,
      switchText: appLocalizations.login,
      onSwitch: () {
        Navigator.pushNamed(context, RoutesManager.login);
      },
      isLogin: false,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormFiled(
                label: appLocalizations.name,
                controller: nameController,
                prefixIcon: Icons.person_2_outlined,
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
                  icon: Icon(secure ? Icons.visibility_off : Icons.visibility),
                ),
              ),

              SizedBox(height: 40.h),
              CustomElevatedButton(
                onPress: () => _createAccount(appLocalizations, context),
                text: appLocalizations.create_account,
                backgroundColor: ColorsManagers.red,
                foregroundColor: ColorsManagers.white,
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  appLocalizations.or_login_with,
                  style: textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomStartUpElevatedButton(
                      onPress: () {},
                      text: appLocalizations.google,
                      path: IconManagers.google,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomStartUpElevatedButton(
                      onPress: () {},
                      text: appLocalizations.facebook,
                      path: IconManagers.facebook,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAccount(
    AppLocalizations appLocalizations,
    BuildContext context,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      UiUtils.showToast(
        context,
        appLocalizations.create_account,
        ColorsManagers.riverBed,
      );
      Navigator.pushNamed(context, RoutesManager.login);
    }
  }
}
