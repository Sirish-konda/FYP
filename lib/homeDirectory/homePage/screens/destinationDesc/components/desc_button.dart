import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/constant_colors.dart';

class DescButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const DescButtons({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: ConstantColors.kLightGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(30.h),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: ConstantColors.kNeutralSkin, fontSize: 20.sp),
        ),
      ),
    );
  }
}
