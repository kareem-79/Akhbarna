import 'package:akhbarna/model/source_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/assets_managers.dart';
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
          borderRadius: BorderRadius.circular(35.r),
          border: source.isSelected
              ? Border.all(color: ColorsManagers.red)
              : Border.all(color: ColorsManagers.blue),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                source.isSelected
                    ? IconManagers.selected
                    : IconManagers.unSelected,
                width: 20.w,
                height: 20.h,
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
            Center(child: Text(source.name, style: textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}
