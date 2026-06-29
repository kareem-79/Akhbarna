import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/utils/timer_format_helper.dart';
import 'package:akhbarna/features/layout/home/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cubit/notification_cubit.dart';

class NotificationItemWidget extends StatefulWidget {
  final NotificationModel notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.notification.isRead;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;
    final Color cardColor = Theme.of(context).cardColor;
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      tween: Tween<double>(begin: 50.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Opacity(
            opacity: (1 - (value / 50)).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 4.sp),
        child: Dismissible(
          key: ValueKey(widget.notification.id),
          direction: DismissDirection.startToEnd,
          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            decoration: BoxDecoration(
              color: ColorsManagers.red,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Icon(Icons.delete, color: ColorsManagers.white, size: 30.sp),
          ),
          onDismissed: (_) {
            context.read<NotificationCubit>().deleteNotification(
              widget.notification.id,
            );
          },
          child: GestureDetector(
            onTap: () async {
              if (!isSelected) {
                context.read<NotificationCubit>().markAsRead(
                  widget.notification.id,
                );

                setState(() {
                  isSelected = true;
                });
              }

              if (widget.notification.articleUrl != null &&
                  widget.notification.articleUrl!.isNotEmpty) {
                final uri = Uri.parse(widget.notification.articleUrl!);

                await launchUrl(
                  uri,
                  mode: LaunchMode.inAppWebView,
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: isSelected
                    ? cardColor.withOpacity(.6)
                    : cardColor,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color: isSelected ? ColorsManagers.gray3 : ColorsManagers.red,
                  width: 2.w,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            IconManagers.notification,
                            color: isSelected
                                ? ColorsManagers.gray3
                                : ColorsManagers.red,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),

                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: textTheme.bodySmall?.copyWith(
                                  color: primaryColor,
                                ),
                                children: [
                                  TextSpan(text: widget.notification.title),
                                  const WidgetSpan(child: SizedBox(width: 5)),
                                  TextSpan(
                                    text: " ${widget.notification.body}",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: ColorsManagers.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  size: 16.sp,
                                  color: ColorsManagers.gray3,
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                    TimeFormatHelper.formatDate(
                                      context,
                                      widget.notification.createdAt
                                          .toIso8601String(),
                                    ),
                                    style: textTheme.bodySmall?.copyWith(
                                      color: ColorsManagers.gray3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
