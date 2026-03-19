import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_managers.dart';

class ImageLocationWidget extends StatelessWidget {
  const ImageLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(image: AssetImage(ImageManagers.selectCountry),width: 150.w,height: 150.h),
          Align(
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage(ImageManagers.location),width: 80.w,height: 80.h),
          )
        ]
    );
  }
}
