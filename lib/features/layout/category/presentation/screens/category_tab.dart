import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/category_tab_model.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "صباح الخير\nإليكم بعض الأخبار",
                  style: textTheme.bodyLarge,
                  maxLines: 2,
                ),
                SizedBox(height: 20.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CategoryTabModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = CategoryTabModel.categories[index];
                    return Image.asset(category.imageBath);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
