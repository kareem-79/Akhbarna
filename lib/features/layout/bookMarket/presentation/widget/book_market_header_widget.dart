import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../l10n/app_localizations.dart';

class BookMarketHeaderWidget extends StatefulWidget {
  const BookMarketHeaderWidget({super.key});

  @override
  State<BookMarketHeaderWidget> createState() => _BookMarketHeaderWidgetState();
}

class _BookMarketHeaderWidgetState extends State<BookMarketHeaderWidget> {
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
              Text(
                "الحفظ",
                style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
              ),
              CircleAvatar(
                backgroundColor: ColorsManagers.white.withOpacity(.4),
                child: Icon(
                  Icons.search_outlined,
                  size: 30.sp,
                  color: ColorsManagers.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
