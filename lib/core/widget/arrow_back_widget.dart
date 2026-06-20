import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBackWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? arrowGroundColor;
  const ArrowBackWidget({super.key, this.backgroundColor, this.arrowGroundColor});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Theme.of(context).cardColor;
    final Color shadowColor = Theme.of(context).shadowColor;
    return Container(
      width: 42.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_new, size: 18.sp, color: arrowGroundColor ?? shadowColor),
      ),
    );
  }
}
