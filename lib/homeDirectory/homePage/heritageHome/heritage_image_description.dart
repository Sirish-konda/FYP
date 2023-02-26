import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constant_colors.dart';
import '../../../models/heritage_model.dart';
import 'destination_desc_heritage.dart';

class HeritageImageDescription extends StatelessWidget {
  final HeritageModel heritage;
  const HeritageImageDescription({super.key, required this.heritage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DestinationDescHeritage(heritageModel: heritage),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20.h),
        height: 255.h,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: ConstantColors.kDarkGreen.withOpacity(0.5),
                blurRadius: 10.r,
                offset: Offset(0, 10.r),
              ),
            ],
            color: ConstantColors.kMidGreen.withOpacity(0.5)),
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
              height: 150.h,
              width: MediaQuery.of(context).size.width.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  heritage.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            Text(
              heritage.title,
              style: TextStyle(
                  color: ConstantColors.kNeutralSkin,
                  fontSize: 28.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black26),
              textAlign: TextAlign.center,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
