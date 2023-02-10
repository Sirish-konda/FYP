import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/components/bodyComponents/popular_title.dart';

import 'package:provider/provider.dart';

import '../../../../providers/hikingPhotoProvider.dart';

class HikingSliderImages extends StatefulWidget {
  const HikingSliderImages({
    super.key,
  });

  @override
  State<HikingSliderImages> createState() => _HikingSliderImagesState();
}

class _HikingSliderImagesState extends State<HikingSliderImages> {
  final controller = CarouselController();

  void back() {
    controller.previousPage(duration: const Duration(milliseconds: 500));
  }

  void forward() {
    controller.nextPage(duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.h,
      alignment: Alignment.topCenter,
      color: ConstantColors.kNeutralSkin.withOpacity(0.1),
      padding: EdgeInsets.only(top: 9.h),
      child: Column(
        children: [
          const PopularTitle(title: "Popular Hike's"),
          SizedBox(height: 10.h),
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: Provider.of<HikingPhotoProvider>(context).imgLength,
            options: CarouselOptions(
              height: 350.h,
              pageSnapping: true,
              enableInfiniteScroll: true,
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 10.h, right: 10.h),
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ConstantColors.kMidGreen.withOpacity(0.4)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          Provider.of<HikingPhotoProvider>(context)
                              .hikingDesc[index]
                              .imagePath,
                          height: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Provider.of<HikingPhotoProvider>(context)
                            .hikingDesc[index]
                            .title,
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
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: ConstantColors.kLightGreen,
                    foregroundColor: ConstantColors.kNeutralSkin),
                onPressed: back,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30.h,
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: ConstantColors.kLightGreen,
                    foregroundColor: ConstantColors.kNeutralSkin),
                onPressed: forward,
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30.h,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
