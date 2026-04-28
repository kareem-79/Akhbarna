import 'package:akhbarna/model/home_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabItemWidget extends StatelessWidget {
  const CustomTabItemWidget({
    super.key,
    required this.homeTabModel,
    required this.isSelected,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
  });

  final HomeTabModel homeTabModel;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: double.infinity,
        constraints: BoxConstraints(minHeight: double.infinity),
        decoration: BoxDecoration(
          color: isSelected ? selectedBgColor : unSelectedBgColor,
          borderRadius: BorderRadius.circular(60.r),
        ),
        alignment: Alignment.center,
        child: Text(
          homeTabModel.name,
          style: GoogleFonts.cairo(
            color: isSelected ? selectedFgColor : unSelectedFgColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
