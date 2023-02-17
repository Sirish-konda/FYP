import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constant_colors.dart';

class ProfileListTile extends StatelessWidget {
  final VoidCallback buttonPressed;
  final String title;
  final IconData leadingIcon;
  const ProfileListTile({
    super.key,
    required this.buttonPressed,
    required this.title,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: buttonPressed,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
      leading: Container(
        height: 45.h,
        width: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: ConstantColors.kDarkGreen.withOpacity(0.1)),
        child: Icon(
          leadingIcon,
          color: ConstantColors.kDarkGreen,
        ),
      ),
      trailing: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: Colors.grey.withOpacity(0.5)),
        child: const Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
