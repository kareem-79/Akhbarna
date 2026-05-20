import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/resources/constant.dart';
import '../../../../../../../core/resources/routes_managers.dart';
import '../../../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../../../l10n/app_localizations.dart';

class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet({super.key});

  @override
  State<LogoutBottomSheet> createState() => _LogoutBottomSheetState();
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4.h,
      decoration: BoxDecoration(
        color: ColorsManagers.gray2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(60.r),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Icon(
                        Icons.logout_outlined,
                        size: 120.sp,
                        color: ColorsManagers.red,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: Text(
                        appLocalizations.logout_confirm_title,
                        style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPress: _logout,
                    text: appLocalizations.yes,
                    foregroundColor: ColorsManagers.white,
                    backgroundColor: ColorsManagers.red,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomElevatedButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    text: appLocalizations.cancel,
                    foregroundColor: ColorsManagers.white,
                    backgroundColor: ColorsManagers.gray2,
                    borderColor: ColorsManagers.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(ChachConstant.tokenKey);

    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesManager.login,
          (route) => false,
    );

    UiUtils.showToast(
      context,
      AppLocalizations.of(context)!
          .logout_confirm_message,
      ColorsManagers.lightGray,
    );
  }
}
