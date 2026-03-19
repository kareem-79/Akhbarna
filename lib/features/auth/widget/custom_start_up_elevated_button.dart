import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStartUpElevatedButton extends StatelessWidget {
  const CustomStartUpElevatedButton({
    super.key,
    required this.onPress,
    required this.text,
    this.backgroundColor,
    required this.path, this.foregroundColor, this.mainAxisAlignment,
  });

  final VoidCallback onPress;
  final String text;
  final String path;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.sp),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Row(
          mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.center,

          children: [
            Text(text),
            SizedBox(width: 8.w),
            SvgPicture.asset(path, width: 24.w, height: 24.h, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
