import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  final String image;
  final bool isSelected;

  const SvgWidget({
    super.key,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: isSelected ? 1.2 : 1,
      child: SvgPicture.asset(
        image,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(
          isSelected
              ? ColorsManagers.blue
              : ColorsManagers.white.withOpacity(.6),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
