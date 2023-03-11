import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants/constant_colors.dart';

class PhotoQr extends StatefulWidget {
  final String path;
  const PhotoQr({super.key, required this.path});

  @override
  State<PhotoQr> createState() => _PhotoQrState();
}

class _PhotoQrState extends State<PhotoQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text('Your Photo'),
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
                child: Image.file(
                  File(widget.path),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
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
                        data: widget.path,
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
