import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../provider/config_provider.dart';

class TextSizeOptionWidget extends StatelessWidget {
  final String size;

  const TextSizeOptionWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        size,
        style: textTheme.bodySmall
      ),
      trailing: Radio<String>(
        value: size,
        groupValue: config.fontSizeLevel,
        onChanged: (val) {
          if (val != null) {
            config.changeFontSize(val);
          }
        },
        activeColor: ColorsManagers.blue,
      ),
    );
  }
}