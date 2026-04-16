import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
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
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const NetworkImage(
                        "https://i.pravatar.cc/300",
                      ),
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
                      onTap: () {},
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
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: Icons.language_outlined,
                      title: appLocalizations.language,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.selectLanguage, arguments: true);
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
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: Icons.logout_outlined,
                      title: appLocalizations.logout,
                      onTap: () {},
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const GeneralSettingsBottomSheet(),
    );
  }
}
