import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/hikingHome/hiking_slider_images.dart';

import 'trekkingHome/trekking_slider_images.dart';
import 'components/headerComponents/home_header.dart';

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
                child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: HomeHeader(),
                ),
                const SliverToBoxAdapter(
                  child: TrekkingSliderImages(),
                ),
                SliverPadding(padding: EdgeInsets.all(10.h)),
                const SliverToBoxAdapter(
                  child: HikingSliderImages(),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
