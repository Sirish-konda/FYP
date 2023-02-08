import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constant_colors.dart';

class LowerButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LowerButton({
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
        height: 45.h,
        width: 328.w,
        decoration: BoxDecoration(
          color: ConstantColors.kLightGreen,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21.sp),
        ),
      ),
    );
  }
}
