import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterRequest.dart';
import 'package:akhbarna/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../firebase/firebase_services.dart';
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
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesManager.login,
          (route) => false,
        );
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
                controller: _nameController,
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
                controller: _emailController,
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
                controller: _passwordController,
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
              BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    UiUtils.showLoadingDialog(context, isDisable: false);
                  } else if (state is RegisterError) {
                    UiUtils.hideDialog(context);
                    UiUtils.showToast(
                      context,
                      state.massage,
                      ColorsManagers.vividTangerine,
                    );
                  } else if (state is RegisterSuccess) {
                    UiUtils.hideDialog(context);
                    UiUtils.showToast(
                      context,
                      appLocalizations.create_account_success,
                      ColorsManagers.riverBed,
                    );
                    Navigator.pushReplacementNamed(context, RoutesManager.login);
                  }
                },
                child: CustomElevatedButton(
                  onPress: () {
                    if (formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<RegisterCubit>(context).register(
                        RegisterRequest(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                  text: appLocalizations.create_account,
                  backgroundColor: ColorsManagers.red,
                  foregroundColor: ColorsManagers.white,
                ),
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
                      onPress: () async {
                        await FirebaseServices.signInWithGoogle(context);
                        _navigate();
                      },
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

  _navigate() async {
    bool hasEnteredBefore = await PrefsManager.checkEntering();
    if (!hasEnteredBefore) {
      await PrefsManager.saveEntering();
      Navigator.pushReplacementNamed(context, RoutesManager.onBoarding);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }
  }
}
