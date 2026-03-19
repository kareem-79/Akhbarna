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
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: ColorsManagers.darkNavy,
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManagers.red, width: 2),
                    borderRadius: BorderRadius.circular(4),
                    color: category.isSelected
                        ? ColorsManagers.red
                        : Colors.transparent,
                  ),
                  child: category.isSelected
                      ?  Icon(Icons.check, size: 14, color: ColorsManagers.white)
                      : null,
                ),
                Text(
                  category.name,
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500,fontSize: 20.sp),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
