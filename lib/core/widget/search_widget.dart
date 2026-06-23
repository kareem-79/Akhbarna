import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        cursorColor: ColorsManagers.red,
        onFieldSubmitted: onSubmitted,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: ColorsManagers.darkNavy),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManagers.gray3),
          filled: true,
          fillColor: ColorsManagers.white2,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: ColorsManagers.darkNavy,
            size: 24.sp,
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
