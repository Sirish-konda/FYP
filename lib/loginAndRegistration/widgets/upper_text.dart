import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class UpperText extends StatelessWidget {
  final String title;
  const UpperText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }
}
