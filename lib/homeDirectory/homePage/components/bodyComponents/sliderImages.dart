import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/components/bodyComponents/popular_title.dart';
import 'package:fyp_project/providers/trekkingPhotoProvider.dart';
import 'package:provider/provider.dart';
import 'imageDescription.dart';

class SliderImages extends StatefulWidget {
  const SliderImages({
    super.key,
  });

  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
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
      height: 455.h,
      alignment: Alignment.topCenter,
      color: ConstantColors.kNeutralSkin.withOpacity(0.1),
      padding: EdgeInsets.only(top: 9.h),
      child: Column(
        children: [
          const PopularTitle(title: "Popular Trek's"),
          SizedBox(height: 10.h),
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: Provider.of<TrekkingPhotoProvider>(context).imgLength,
            options: CarouselOptions(
              height: 350.h,
              pageSnapping: true,
              enableInfiniteScroll: true,
              initialPage: 0,
              viewportFraction: 0.75,
              // enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIndex) {
              return ImageDescription(
                trekking: Provider.of<TrekkingPhotoProvider>(context)
                    .trekkingDesc[index],
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
                child: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30,
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
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30,
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
