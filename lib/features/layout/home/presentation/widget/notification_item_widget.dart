import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';

class NotificationItemWidget extends StatefulWidget {
  final VoidCallback onDelete;

  const NotificationItemWidget({super.key, required this.onDelete});

  @override
  State<NotificationItemWidget> createState() =>
      _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 4.sp),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          decoration: BoxDecoration(
            color: ColorsManagers.red,
            borderRadius: BorderRadius.circular(25),
          ),
          child:  Icon(
            Icons.delete,
            color: ColorsManagers.white,
            size: 30,
          ),
        ),
        onDismissed: (direction) {
          widget.onDelete();
        },

        child: Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: ColorsManagers.gray2,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: ColorsManagers.red),
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),

                        RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: textTheme.bodySmall?.copyWith(color: primaryColor),
                            children: [
                              TextSpan(
                                text:
                                "وزير الري المصري الأسبق: قوى خارجية تحرك إثيوبيا ",
                              ),
                              TextSpan(
                                text: "اقرأ المزيد...",
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
                            Icon(Icons.remove_red_eye,
                                size: 16.sp,
                                color: ColorsManagers.gray3),
                            SizedBox(width: 5.w),
                            Text("12.5k",
                                style: textTheme.bodySmall?.copyWith(
                                    color: ColorsManagers.gray3)),
                            Spacer(),
                            Text("منذ 5 دقائق",
                                style: textTheme.bodySmall?.copyWith(
                                    color: ColorsManagers.gray3)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Column(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                            SourceImageManagers.elgzira),
                      ),
                      SizedBox(height: 12.h),
                      SvgPicture.asset(
                        IconManagers.notification,
                        color: ColorsManagers.red,
                        width: 28.w,
                        height: 28.h,
                      ),
                    ],
                  ),
                ],
              ),

              PositionedDirectional(
                top: 0,
                start: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Icon(
                    isSelected
                        ? Icons.bookmark
                        : Icons.bookmark_border_outlined,
                    color: ColorsManagers.red,
                    size: 28.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}