import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constant_colors.dart';

class SquareSettings extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  const SquareSettings({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 150.w,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll<double>(10),
          backgroundColor: MaterialStateProperty.all<Color>(
              ConstantColors.kDarkGreen.withOpacity(0.7)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0.r),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 30.h,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
