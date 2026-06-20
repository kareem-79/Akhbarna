import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/utils/font_size.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../provider/config_provider.dart';

class TextSizeOptionWidget extends StatelessWidget {
  final FontSize size;
  final bool isLast;

  const TextSizeOptionWidget({
    super.key,
    required this.size,
    this.isLast = false,
  });

  String _label(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    switch (size) {
      case FontSize.small:
        return appLocalizations.small;
      case FontSize.medium:
        return appLocalizations.medium;
      case FontSize.large:
        return appLocalizations.large;
      case FontSize.extraLarge:
        return appLocalizations.extra_large;
      case FontSize.auto:
        return appLocalizations.auto_simple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigProvider>();
    final textTheme = Theme.of(context).textTheme;
    final shadowColor = Theme.of(context).shadowColor;
    return InkWell(
      onTap: () => config.changeFontSize(size),
      child: Container(
        height: 64.h,
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(
                    color: shadowColor.withOpacity(.08),
                  ),
                ),
        ),
        child: Row(
          children: [
            Radio<FontSize>(
              value: size,
              groupValue: config.effectiveFontSize,
              onChanged: (value) {
                if (value != null) {
                  config.changeFontSize(value);
                }
              },
              activeColor: ColorsManagers.red,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsManagers.red;
                }
                return shadowColor;
              }),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            SizedBox(width: 8.w),
            Text(
              _label(context),
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "أخبارنا",
              style: textTheme.bodyMedium?.copyWith(
                fontSize: switch (size) {
                  FontSize.small => 14.sp,
                  FontSize.medium => 18.sp,
                  FontSize.large => 22.sp,
                  FontSize.extraLarge => 26.sp,
                  FontSize.auto => 18.sp,
                },
                color: shadowColor.withOpacity(.5),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
