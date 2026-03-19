import 'package:akhbarna/model/source_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
class SourceItemWidget extends StatelessWidget {
  final SourceModel source;
  final VoidCallback onTap;

  const SourceItemWidget({
    super.key,
    required this.source,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: ColorsManagers.darkNavy,
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManagers.red, width: 2),
                    borderRadius: BorderRadius.circular(4),
                    color: source.isSelected
                        ? ColorsManagers.red
                        : Colors.transparent,
                  ),
                  child: source.isSelected
                      ?  Icon(Icons.check, size: 14, color: ColorsManagers.white)
                      : null,
                ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  source.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Center(
              child: Text(
                source.name,
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
