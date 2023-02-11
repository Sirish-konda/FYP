import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/components/bodyComponents/hiking_slider_images.dart';
import 'package:fyp_project/providers/trekkingPhotoProvider.dart';
import 'package:provider/provider.dart';
import '../../providers/hikingPhotoProvider.dart';
import 'components/bodyComponents/trekking/trekking_slider_images.dart';
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
