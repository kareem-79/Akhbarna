import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/validation.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/state/forget_password_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    TextTheme textTheme = Theme.of(context).textTheme;

    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          UiUtils.showLoadingDialog(context);
        } else if (state is ForgetPasswordError) {
          UiUtils.hideDialog(context);

          UiUtils.showToast(context, state.message, ColorsManagers.red);
        } else if (state is ForgetPasswordSuccess) {
          UiUtils.hideDialog(context);
          UiUtils.showToast(context, state.message, Colors.green);
          Navigator.pushReplacementNamed(
            context,
            RoutesManager.loginWithOtp,
            arguments: emailController.text,
          );
        }
      },

      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: Form(
                key: formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    AppBarWidget(title: "", height: 40),

                    Image.asset(
                      ImageManagers.forgetPassword,
                      width: 210.w,
                      height: 210.h,
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      appLocalizations.forgot_password,

                      style: textTheme.bodyLarge,
                    ),

                    SizedBox(height: 30.h),

                    Text(
                      appLocalizations.reset_password_instruction,

                      style: textTheme.bodySmall?.copyWith(
                        color: ColorsManagers.lightGray,
                      ),
                    ),

                    SizedBox(height: 10.h),

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

                    SizedBox(height: 20.h),

                    Text(
                      appLocalizations.reset_password_note,

                      style: textTheme.bodySmall,

                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 80.h),
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
            onPress: () => _enterEmail(),

            text: appLocalizations.next,

            backgroundColor: ColorsManagers.red,

            foregroundColor: ColorsManagers.white,
          ),
        ),
      ),
    );
  }

  Future<void> _enterEmail() async {
    if (formKey.currentState?.validate() ?? false) {
      context.read<ForgetPasswordCubit>().sendOtp(emailController.text.trim());
    }
  }
}
