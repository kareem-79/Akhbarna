import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/core/widget/custom_text_form_field.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../../core/widget/custom_text_button.dart';
import '../../../../../firebase/firebase_services.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../auth_layout.dart';
import '../../../widget/custom_start_up_elevated_button.dart';
import '../cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool secure = true;
  var formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AuthLayout(
      title: appLocalizations.welcome_back,
      switchText: appLocalizations.register_now,
      onSwitch: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesManager.register,
          (route) => false,
        );
      },
      isLogin: true,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  onPress: () {
                    Navigator.pushNamed(context, RoutesManager.forgetPassword);
                  },
                  text: appLocalizations.forgot_password,
                ),
              ),
              SizedBox(height: 40.h),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    UiUtils.showLoadingDialog(context, isDisable: false);
                  } else if (state is LoginError) {
                    UiUtils.hideDialog(context);
                    UiUtils.showToast(
                      context,
                      state.massage,
                      ColorsManagers.vividTangerine,
                    );
                  } else if (state is LoginSuccess) {
                    UiUtils.hideDialog(context);
                    UiUtils.showToast(
                      context,
                      appLocalizations.login_success,
                      ColorsManagers.riverBed,
                    );
                    _navigate();
                  }
                },
                child: CustomElevatedButton(
                  onPress: () {
                    if (formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<LoginCubit>(context).login(
                        LoginRequest(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                  text: appLocalizations.login,
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
                        final response =
                            await FirebaseServices.signInWithGoogle(context);

                        if (response != null) {
                          _navigate();
                        }
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
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.onBoarding,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.mainLayout,
        (route) => false,
      );
    }
  }
}
