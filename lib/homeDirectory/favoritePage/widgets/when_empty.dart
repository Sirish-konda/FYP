import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constant_colors.dart';

class WhenEmpty extends StatelessWidget {
  const WhenEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/null_icon.png"),
            Text(
              "You haven't added any destination as favorite.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ConstantColors.kNeutralSkin, fontSize: 20.sp),
            ),
           
          ],
        ),
      ),
    );
  }
}
