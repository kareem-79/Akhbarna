import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:akhbarna/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/search_widget.dart';

class CategoryHeaderWidget extends StatefulWidget {
  final String hintText;

  const CategoryHeaderWidget({super.key, required this.hintText});

  @override
  State<CategoryHeaderWidget> createState() => _CategoryHeaderWidgetState();
}

class _CategoryHeaderWidgetState extends State<CategoryHeaderWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 52.w,
              height: 52.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const ArrowBackWidget(),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SearchWidget(
                hintText: widget.hintText,
                controller: searchController,
              ),
            ),

            SizedBox(width: 12.w),
            Visibility(
              visible: widget.hintText == "رياضة",
              replacement: const SizedBox.shrink(),
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: ColorsManagers.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sports_soccer,
                  color: ColorsManagers.red,
                  size: 30.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
