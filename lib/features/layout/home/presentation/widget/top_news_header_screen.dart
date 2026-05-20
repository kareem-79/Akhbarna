import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';

class TopNewsHeaderWidget extends StatefulWidget {

  const TopNewsHeaderWidget({super.key});

  @override
  State<TopNewsHeaderWidget> createState() =>
      _TopNewsHeaderWidgetState();
}

class _TopNewsHeaderWidgetState extends State<TopNewsHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBackWidget(),
              Text(
                "اخر الاخبار",
                style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
