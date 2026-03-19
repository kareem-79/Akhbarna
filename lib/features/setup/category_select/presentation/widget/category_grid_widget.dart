import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../model/category_model.dart';
import 'category_item_widget.dart';

class CategoryGridWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(int) onTap;

  const CategoryGridWidget({
    super.key,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true ,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return CategoryItemWidget(
          category: categories[index],
          onTap: () => onTap(index),
        );
      },
    );
  }
}