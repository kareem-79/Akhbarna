import 'package:akhbarna/features/layout/home/presentation/cubit/notification_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/state/notification_state.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/notification_widget/notification_header_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/notification_widget/notification_item_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../widget/notification_widget/notification_loading_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final shadowColor = Theme.of(context).shadowColor;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          NotificationHeaderWidget(
            onDeleteAll: () {
              context.read<NotificationCubit>().deleteAllNotifications();
            },
          ),
          SizedBox(height: 6.h),
          Expanded(
            child: BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                if (state is NotificationLoading) {
                  return const NotificationLoadingWidget();
                }
                if (state is NotificationError) {
                  return Center(child: Text(state.message));
                }
                if (state is NotificationSuccess) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await context.read<NotificationCubit>().getNotifications();
                    },
                    child: state.notifications.isEmpty
                        ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: 120.h),
                        Center(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                IconManagers.noNotification,
                                width: 250.w,
                                height: 250.h,
                                color: shadowColor,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                appLocalizations.no_notifications,
                                style: textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                        : ListView.separated(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.notifications.length,
                      separatorBuilder: (_, __) => SizedBox(height: 4.h),
                      itemBuilder: (context, index) {
                        return NotificationItemWidget(
                          notification: state.notifications[index],
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
