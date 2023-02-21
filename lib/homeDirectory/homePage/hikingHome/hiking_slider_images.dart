import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:provider/provider.dart';
import '../../../providers/hiking_photo_provider.dart';
import '../screens/widgets/popular_title.dart';
import 'hiking_image_description.dart';

class HikingSliderImages extends StatefulWidget {
  const HikingSliderImages({super.key});

  @override
  State<HikingSliderImages> createState() => _HikingSliderImagesState();
}

class _HikingSliderImagesState extends State<HikingSliderImages> {
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
          const PopularTitle(title: "Popular Hike's"),
          CarouselSlider.builder(
            itemCount: Provider.of<HikingPhotoProvider>(context).imgLength,
            itemBuilder: (context, index, realIndex) {
              final hiking =
                  Provider.of<HikingPhotoProvider>(context).hikingDesc[index];
              return HikingImageDescription(
                hiking: hiking,
              );
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
