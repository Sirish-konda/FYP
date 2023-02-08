import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/providers/trekkingPhotoProvider.dart';
import 'package:provider/provider.dart';
import 'components/bodyComponents/sliderImages.dart';
import 'components/headerComponents/home_header.dart';
import 'components/bodyComponents/popular_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeHeader(),
                    SizedBox(height: 20.h),
                    const SliderImages(),
                    SizedBox(height: 20.h),
                    SizedBox(height: 20.h),
                    
                    SliderImages()
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
