import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constant_colors.dart';

class PopularTitle extends StatelessWidget {
  final String title;
  const PopularTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
          color: ConstantColors.kNeutralSkin,
          decoration: TextDecoration.overline),
    );
  }
}
