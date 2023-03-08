
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constant_colors.dart';

class RulesWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const RulesWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kLightGreen,
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
            children: const [
              TextSpan(
                text: 'About ',
                style: TextStyle(color: ConstantColors.kNeutralSkin),
              ),
              TextSpan(
                text: 'Location',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.h),
          padding: EdgeInsets.all(20.h),
          height: 500.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ConstantColors.kNeutralSkin,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Text(
                "Rules and regulations to follow while going on a trek one of these treks in Nepal:",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                '''
1. You should drink water
2. You should eat food.
3. This looks good to be honest.
''',
                style: TextStyle(
                    fontWeight: FontWeight.w500, letterSpacing: 0.5.sp),
              ),
              Row(
                children: [
                  Text(
                    "If you agree to follow these rules.",
                    style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: ConstantColors.kLightGreen),
                      onPressed: onPressed,
                      child: Text(
                        "Press me",
                        style: TextStyle(
                            color: ConstantColors.kNeutralSkin,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
