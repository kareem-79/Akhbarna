import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/logout/presentation/logout_bottom_sheet.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/custom_blur_bottom_sheet.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../model/language_model.dart';
import '../widget/enlargable_profile_avatar.dart';
import '../widget/settings_divider_widget.dart';
import '../widget/settings_section_widget.dart';
import '../widget/settings_tile_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? _profileImagePath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;
    final currentLanguage = AppLanguage.languages.firstWhere(
      (lang) => lang.code == Localizations.localeOf(context).languageCode,
      orElse: () => AppLanguage.languages.first,
    );
    final Color cardColor = Theme.of(context).cardColor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ArrowBackWidget()],
              ),
              SizedBox(height: 20.h),
              Text("الإعدادات", style: textTheme.bodyMedium),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: cardColor,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: ColorsManagers.red,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: ColorsManagers.white,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PrefsManager.getUserName(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Egypt",
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    EnlargableProfileAvatar(
                      imagePath: _profileImagePath,
                      radius: 28.r,
                      isEditable: false,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 28.h),

              Text(
                "الحساب",
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),

              SizedBox(height: 10.h),

              SettingsSectionWidget(
                children: [
                  SettingsTileWidget(
                    title: appLocalizations.account_information,
                    subtitle: "الاسم، البريد، الصورة",
                    icon: Icons.person_outline,
                    iconColor: ColorsManagers.azureRadiance,
                    iconBackgroundColor: ColorsManagers.azureRadiance
                        .withValues(alpha: .15),
                    onTap: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        RoutesManager.editProfile,
                        arguments: _profileImagePath,
                      );

                      if (result != null && result is String) {
                        setState(() {
                          _profileImagePath = result;
                        });
                      }
                    },
                  ),

                  const SettingsDividerWidget(),

                  SettingsTileWidget(
                    title: appLocalizations.security_settings,
                    subtitle: appLocalizations.password,
                    icon: Icons.lock_outline,
                    iconColor: ColorsManagers.red,
                    iconBackgroundColor: ColorsManagers.red.withValues(
                      alpha: .15,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.security);
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              Text(
                "التفضيلات",
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),

              SizedBox(height: 10.h),

              SettingsSectionWidget(
                children: [
                  SettingsTileWidget(
                    title: appLocalizations.general_settings,
                    subtitle: "المظهر، حجم الخط، المصادر",
                    icon: Icons.settings_outlined,
                    iconColor: ColorsManagers.yellowDark,
                    iconBackgroundColor: ColorsManagers.yellowLight,
                    onTap: () => Navigator.pushNamed(
                      context,
                      RoutesManager.generalSettings,
                    ),
                  ),

                  const SettingsDividerWidget(),

                  SwitchListTile(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.red,
                    title: Text(
                      appLocalizations.notifications,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    secondary: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: ColorsManagers.mintDark.withOpacity(.3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: ColorsManagers.mintDark,
                      ),
                    ),
                  ),

                  const SettingsDividerWidget(),

                  SettingsTileWidget(
                    title: appLocalizations.language,
                    subtitle: currentLanguage.name,
                    icon: Icons.language,
                    iconColor: ColorsManagers.purpleDark,
                    iconBackgroundColor: ColorsManagers.purpleLight,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.selectLanguage,
                        arguments: true,
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              Text(
                "الدعم",
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),

              SizedBox(height: 10.h),

              SettingsSectionWidget(
                children: [
                  SettingsTileWidget(
                    title: "الاسئلة الشائعة",
                    icon: Icons.help_outline,
                    iconColor: ColorsManagers.mintDark,
                    iconBackgroundColor: ColorsManagers.mintLight,
                    onTap: () {},
                  ),
                  const SettingsDividerWidget(),

                  SettingsTileWidget(
                    title: appLocalizations.about_us,
                    subtitle: "Version 1.0.0",
                    icon: Icons.info_outline,
                    iconColor: ColorsManagers.skyBlueDark,
                    iconBackgroundColor: ColorsManagers.skyBlueLight,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.aboutUs);
                    },
                  ),
                ],
              ),
              CustomElevatedButton(
                text: appLocalizations.logout,
                foregroundColor: ColorsManagers.white,
                borderColor: ColorsManagers.red,
                backgroundColor: ColorsManagers.red.withOpacity(.5),
                onPress: () => _showLogoutBottomSheet(context),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
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
