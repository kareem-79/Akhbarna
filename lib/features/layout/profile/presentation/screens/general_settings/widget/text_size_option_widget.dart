import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../core/utils/font_size.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../provider/config_provider.dart';

class TextSizeOptionWidget extends StatelessWidget {
  final FontSize size;

  const TextSizeOptionWidget({super.key, required this.size});

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
    final config = Provider.of<ConfigProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        _label(context),
        style: textTheme.bodyMedium?.copyWith(
          fontSize: 20.sp,
          color: ColorsManagers.white,
        ),
      ),
      trailing: Radio<FontSize>(
        value: size,
        groupValue: config.effectiveFontSize,
        onChanged: (val) {
          if (val != null) {
            config.changeFontSize(val);
          }
        },
        activeColor: Colors.blue,
      ),
    );
  }
}