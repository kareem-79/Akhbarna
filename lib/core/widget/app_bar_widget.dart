import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/colors_managers.dart';
import 'arrow_back_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.height,
    this.color, 
  });

  final String title;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ArrowBackWidget(),
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                color: color ?? ColorsManagers.red,
              ),
            ),
          ],
        ),
        SizedBox(height: height.h),
      ],
    );
  }
}