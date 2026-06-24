import 'package:akhbarna/features/layout/home/presentation/widget/notification_widget./notification_item_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../widget/notification_widget./notification_header_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<int> items = List.generate(20, (index) => index + 1);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          NotificationHeaderWidget(
            onDeleteAll: () {
              setState(() {
                items.clear();
              });
            },
          ),
          SizedBox(height: 6.h),
          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconManagers.noNotification,
                          width: 250.w,
                          height: 250.h,
                          color: shadowColor,
                        ),
                        SizedBox(height: 10.h),
                        Text(appLocalizations.no_notifications, style: textTheme.bodyLarge),
                      ],
                    ),
                  )
                : CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.zero,
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return NotificationItemWidget(
                              onDelete: () {
                                setState(() {
                                  items.removeAt(index);
                                });
                              },
                            );
                          }, childCount: items.length),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
