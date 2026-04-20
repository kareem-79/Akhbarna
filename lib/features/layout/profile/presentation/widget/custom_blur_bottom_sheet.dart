import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBlurBottomSheet extends StatelessWidget {
  const CustomBlurBottomSheet({
    super.key,
    required this.child,
    this.blurSigma = 4,
    this.overlayColor,
  });

  final Widget child;
  final double blurSigma;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          behavior: HitTestBehavior.opaque,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigma,
              sigmaY: blurSigma,
            ),
            child: Container(
              color: overlayColor ?? Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ],
    );
  }
}