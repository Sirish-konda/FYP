import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destination_desc.dart';
import 'package:fyp_project/models/trekking_model.dart';
import '../../../../../constants/constant_colors.dart';

class ImageDescription extends StatelessWidget {
  final TrekkingModel trekking;
  const ImageDescription({
    super.key,
    required this.trekking,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DestinationDesc(trekkingModel: trekking)));
      },
      child: Container(
        margin: EdgeInsets.all(20.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ConstantColors.kDarkGreen.withOpacity(0.5),
                blurRadius: 10.r,
                offset: Offset(0, 10.r),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: ConstantColors.kMidGreen.withOpacity(0.4)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                trekking.imagePath,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              trekking.title,
              style: TextStyle(
                  decorationColor: Colors.black26,
                  fontSize: 28.sp,
                  color: ConstantColors.kNeutralSkin,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
