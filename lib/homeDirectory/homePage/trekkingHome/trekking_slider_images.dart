import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/providers/trekking_photo_provider.dart';
import 'package:provider/provider.dart';
import '../screens/widgets/popular_title.dart';
import 'trekking_image_description.dart';

class TrekkingSliderImages extends StatefulWidget {
  const TrekkingSliderImages({
    super.key,
  });

  @override
  State<TrekkingSliderImages> createState() => _TrekkingSliderImagesState();
}

class _TrekkingSliderImagesState extends State<TrekkingSliderImages> {
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
      padding: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: ConstantColors.kNeutralSkin.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          const PopularTitle(
            title: "Popular Trek's",
          ),
          // const PopularTitle(title: "Popular Trek's"),
          SizedBox(height: 10.h),
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: Provider.of<TrekkingPhotoProvider>(context).imgLength,
            options: CarouselOptions(
              height: 300.h,
              pageSnapping: true,
              enableInfiniteScroll: true,
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            itemBuilder: (context, index, realIndex) {
              return TrekkkingImageDescription(
                trekking: Provider.of<TrekkingPhotoProvider>(context)
                    .trekkingDesc[index],
              );
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
