import 'package:flutter/material.dart';
import '../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../model/source_model.dart';

class SourceSwitchTile extends StatelessWidget {
  final SourceModel source;
  final ValueChanged<bool> onChanged;

  const SourceSwitchTile({
    super.key,
    required this.source,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(source.imagePath, width: 30, height: 30),
      title: Text(source.name, style: textTheme.bodySmall),
      trailing: Switch(
        value: source.isSelected,
        onChanged: onChanged,
        activeColor: ColorsManagers.white,
        activeTrackColor: ColorsManagers.red,
        inactiveThumbColor: ColorsManagers.white,
        inactiveTrackColor: ColorsManagers.gray3,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
