import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/homeDirectory/homePage/heritageHome/heritage_image_description.dart';
import 'package:fyp_project/providers/heritage_photo_provider.dart';
import 'package:provider/provider.dart';
import '../../../constants/constant_colors.dart';

import '../screens/widgets/popular_title.dart';

class HeritageSliderImages extends StatelessWidget {
  const HeritageSliderImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: ConstantColors.kNeutralSkin.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          const PopularTitle(title: "Heritage Site's"),
          CarouselSlider.builder(
            itemCount: Provider.of<HeritagePhotoProvider>(context).imgLength,
            itemBuilder: (context, index, realIndex) {
              final heritage = Provider.of<HeritagePhotoProvider>(context)
                  .heritageDesc[index];
              return HeritageImageDescription(heritage: heritage);
            },
            options: CarouselOptions(
              height: 300.h,
              pageSnapping: true,
              enableInfiniteScroll: true,
              initialPage: 0,
              viewportFraction: 0.75,
            ),
          ),
        ],
      ),
    );
  }
}
