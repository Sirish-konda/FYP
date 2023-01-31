import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';

class ProfileSettings extends StatelessWidget {
  final String title;
  final VoidCallback buttonPressed;
  const ProfileSettings({
    super.key,
    required this.title,
    required this.buttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 300.w,
      child: TextButton(
          onPressed: buttonPressed,
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
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
          )),
    );
  }
}
