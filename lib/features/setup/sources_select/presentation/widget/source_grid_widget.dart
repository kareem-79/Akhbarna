import 'package:akhbarna/features/setup/sources_select/presentation/widget/source_item_widget.dart';
import 'package:akhbarna/model/source_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SourceGridWidget extends StatelessWidget {
  final List<SourceModel> sources;
  final Function(int) onTap;

  const SourceGridWidget({
    super.key,
    required this.sources,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true ,
      physics: NeverScrollableScrollPhysics(),
      itemCount: sources.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return SourceItemWidget(
          source: sources[index],
          onTap: () => onTap(index),
        );
      },
    );
  }
}
