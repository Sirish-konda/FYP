import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/widgets/destination_desc.dart';
import 'package:fyp_project/models/trekking_model.dart';
import '../../../../constants/constant_colors.dart';

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
        margin: EdgeInsets.only(left: 10.h, right: 10.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ConstantColors.kMidGreen.withOpacity(0.4)),
        child: Column(
          children: [
            Container(
              height: 350.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(trekking.imagePath),
                    fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              trekking.title,
              style: TextStyle(
                  decorationColor: Colors.black26,
                  fontSize: 30.sp,
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
