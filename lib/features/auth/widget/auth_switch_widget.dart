import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../l10n/app_localizations.dart';
import 'auth_switch_item_widget.dart';

class AuthSwitch extends StatelessWidget {
  const AuthSwitch({
    super.key,
    required this.isLogin,
    required this.onSwitch,
    required this.textTheme,
  });

  final bool isLogin;
  final VoidCallback onSwitch;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onSwitch,
        child: Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(
            children: [
              AuthSwitchItem(
                isActive: isLogin,
                text: appLocalizations.register_now,
                icon: Icons.person_outlined,
                textTheme: textTheme,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(width: 6.w),
              AuthSwitchItem(
                isActive: !isLogin,
                text: appLocalizations.create_account,
                icon: Icons.person_add_alt_1_outlined,
                textTheme: textTheme,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }
}