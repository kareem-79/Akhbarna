import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
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
          border: category.isSelected
              ? Border.all(color: ColorsManagers.red)
              : Border.all(color: ColorsManagers.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManagers.red, width: 2),
                    borderRadius: BorderRadius.circular(4.r),
                    color: category.isSelected
                        ? ColorsManagers.red
                        : Colors.transparent,
                  ),
                  child: category.isSelected
                      ? Icon(Icons.check, size: 14.sp, color: ColorsManagers.white)
                      : null,
                ),
                Text(
                  category.name,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(category.image, width: 170.w, height: 170.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
