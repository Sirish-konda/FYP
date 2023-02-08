import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constant_colors.dart';

class LowerPart extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  const LowerPart({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: Colors.black26),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: ConstantColors.kLightGreen),
          ),
        )
      ],
    );
  }
}
