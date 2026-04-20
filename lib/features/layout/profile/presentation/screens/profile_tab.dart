import 'dart:ui';

import 'package:akhbarna/features/layout/profile/presentation/screens/logout/presentation/logout_bottom_sheet.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/custom_blur_bottom_sheet.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../widget/enlargable_profile_avatar.dart';
import 'general_settings/presentation/general_setting_bottom_sheet.dart';
import '../widget/profile_item_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                AppBarWidget(
                  title: appLocalizations.account_management,
                  height: 30,
                  color: shadowColor,
                ),
                Row(
                  children: [
                    EnlargableProfileAvatar(
                      imageUrl: "https://i.pravatar.cc/300",
                      radius: 40.r,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kareem Mohamed",
                            style: textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Egypt",
                            maxLines: 2,
                            style: textTheme.bodySmall?.copyWith(
                              color: ColorsManagers.lightGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 1.1,
                  children: [
                    ProfileItemWidget(
                      icon: Icons.person_outline_outlined,
                      title: appLocalizations.account_information,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.editProfile,
                          arguments: true,
                        );
                      },
                    ),
                    ProfileItemWidget(
                      icon: Icons.tune_outlined,
                      title: appLocalizations.general_settings,
                      onTap: () => _showGeneralSettings(context),
                    ),
                    ProfileItemWidget(
                      icon: Icons.notifications_none_outlined,
                      title: appLocalizations.notifications,
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: Icons.security_outlined,
                      title: appLocalizations.security_settings,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.security);
                      },
                    ),
                    ProfileItemWidget(
                      icon: Icons.language_outlined,
                      title: appLocalizations.language,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.selectLanguage,
                          arguments: true,
                        );
                      },
                    ),
                    ProfileItemWidget(
                      icon: Icons.help_outline,
                      title: appLocalizations.help_center,
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: Icons.info_outline,
                      title: appLocalizations.about_us,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.aboutUs);
                      },
                    ),
                    ProfileItemWidget(
                      icon: Icons.logout_outlined,
                      title: appLocalizations.logout,
                      onTap: () => _showLogoutBottomSheet(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showGeneralSettings(BuildContext context) {
    showBlurBottomSheet(context, child: const GeneralSettingsBottomSheet());
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showBlurBottomSheet(context, child: const LogoutBottomSheet());
  }

  void showBlurBottomSheet(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder: (_) => CustomBlurBottomSheet(child: child),
    );
  }
}
