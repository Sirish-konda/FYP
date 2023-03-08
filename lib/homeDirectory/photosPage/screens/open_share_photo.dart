import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OpenSharePhoto extends StatefulWidget {
  const OpenSharePhoto({super.key});

  @override
  State<OpenSharePhoto> createState() => _OpenSharePhotoState();
}

class _OpenSharePhotoState extends State<OpenSharePhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kDarkGreen,
        title: Text('Your Photo'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: ConstantColors.kLightGreen,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 250.h,
              width: 300.w,
              color: Colors.amber,
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Share this photo",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ConstantColors.kNeutralSkin),
                    ),
                    Text(
                      "Scan this QR code to add this photo to \n your account",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ConstantColors.kNeutralSkin.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 200.h,
                      width: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: QrImage(
                        data: 'https://unsplash.com/photos/zx9t5TaJNPQ',
                        version: QrVersions.auto,
                        size: 200,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
