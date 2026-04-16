import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: ColorsManagers.white2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        icon:  Icon(Icons.arrow_back,color:ColorsManagers.darkNavy),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
