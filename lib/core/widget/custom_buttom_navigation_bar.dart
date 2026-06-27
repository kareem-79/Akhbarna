import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_elevated_button.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.onPress,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
  });

  final VoidCallback onPress;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        top: 10.h,
      ),
      child: CustomElevatedButton(
        onPress: onPress,
        text: text,
        isLoading: isLoading,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
    );
  }
}
