import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/assets_managers.dart';
import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../profile/presentation/widget/custom_blur_bottom_sheet.dart';
import '../../cubit/notification_cubit.dart';
import '../../cubit/state/notification_state.dart';
import '../notification_widget/delete_notification_buttom_sheet.dart';

class NotificationHeaderWidget extends StatefulWidget {
  final VoidCallback onDeleteAll;

  const NotificationHeaderWidget({super.key, required this.onDeleteAll});

  @override
  State<NotificationHeaderWidget> createState() =>
      _NotificationHeaderWidgetState();
}

class _NotificationHeaderWidgetState extends State<NotificationHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBackWidget(),
              Text(
                appLocalizations.notifications,
                style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
              ),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  final hasNotifications =
                      state is NotificationSuccess &&
                      state.notifications.isNotEmpty;

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: hasNotifications
                        ? InkWell(
                            key: const ValueKey("delete"),
                            onTap: () =>
                                _showDeleteNotificationBottomSheet(context),
                            child: SvgPicture.asset(
                              IconManagers.delete,
                              width: 50.w,
                              height: 50.h,
                            ),
                          )
                        : SizedBox(
                            key: const ValueKey("empty"),
                            width: 50.w,
                            height: 50.h,
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteNotificationBottomSheet(BuildContext context) {
    showBlurBottomSheet(
      context,
      child: DeleteNotificationBottomSheet(
        onDelete: () {
          context.read<NotificationCubit>().deleteAllNotifications();
        },
      ),
    );
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
