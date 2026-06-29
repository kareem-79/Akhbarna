import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String description;

  const TermsItemWidget({
    super.key,
    required this.index,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$index. $title",
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            description,
            style: textTheme.bodySmall?.copyWith(color: primaryColor),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
