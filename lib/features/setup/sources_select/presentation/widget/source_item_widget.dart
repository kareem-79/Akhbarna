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
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          color: ColorsManagers.darkNavy,
          borderRadius: BorderRadius.circular(35.r),
          border:source.isSelected? Border.all(color: ColorsManagers.red):Border.all(color: ColorsManagers.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManagers.red, width: 2),
                    borderRadius: BorderRadius.circular(4.r),
                    color: source.isSelected
                        ? ColorsManagers.red
                        : Colors.transparent,
                  ),
                  child: source.isSelected
                      ?  Icon(Icons.check, size: 14.sp, color: ColorsManagers.white)
                      : null,
                ),
            ),
             SizedBox(height: 10.h),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  source.imagePath,
                  width: 150.w,
                  height: 150.h,

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
