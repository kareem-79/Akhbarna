import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';

class BookMarketHeaderWidget extends StatefulWidget {
  final VoidCallback? onDeleteAll;
  final bool hasSelection;

  const BookMarketHeaderWidget({
    super.key,
    this.onDeleteAll,
    required this.hasSelection,
  });

  @override
  State<BookMarketHeaderWidget> createState() => _BookMarketHeaderWidgetState();
}

class _BookMarketHeaderWidgetState extends State<BookMarketHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color bg = Theme.of(context).scaffoldBackgroundColor;
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      height: topPadding + 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: topPadding + 20.h,
          bottom: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appLocalizations.bookmarks,
              style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: widget.hasSelection
                  ? PopupMenuButton<String>(
                      key: const ValueKey("menu"),
                      offset: const Offset(0, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      color: bg,
                      onSelected: (value) {
                        if (value == 'delete_all') {
                          widget.onDeleteAll?.call();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'delete_all',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: ColorsManagers.red,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                appLocalizations.delete_all,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorsManagers.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      child: CircleAvatar(
                        backgroundColor: ColorsManagers.white.withOpacity(.4),
                        child: Icon(
                          Icons.more_vert,
                          size: 28.sp,
                          color: ColorsManagers.white,
                        ),
                      ),
                    )
                  : const SizedBox(key: ValueKey("empty"), width: 40),
            ),
          ],
        ),
      ),
    );
  }
}
