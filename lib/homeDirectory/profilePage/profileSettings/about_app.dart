import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  bool isBack = false;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.kDarkGreen,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'About the app',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _flip,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: angle),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double val, __) {
                  if (val >= (pi / 2)) {
                    isBack = false;
                  } else {
                    isBack = true;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(val),
                    child: SizedBox(
                      width: 309.w,
                      height: 400.h,
                      child: isBack
                          ? Container(
                              padding: EdgeInsets.all(20.h),
                              decoration: BoxDecoration(
                                color: ConstantColors.kNeutralSkin,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    height: 200.h,
                                    fit: BoxFit.fitHeight,
                                    image: const AssetImage(
                                        "assets/images/logo.png"),
                                  ),
                                  SizedBox(height: 40.h),
                                  Text(
                                    "Do you wanna know about us?",
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    '(If you are a curious traveller then click me)',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 10.h, right: 10.h),
                                decoration: BoxDecoration(
                                  color: ConstantColors.kNeutralSkin,
                                  border: Border.all(
                                      color: Colors.black, width: 5.w),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "About us",
                                      style: TextStyle(
                                          fontSize: 39.sp,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(height: 7.h),
                                    Text(
                                      "Mero गन्तव्य",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ConstantColors.kDarkGreen),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
