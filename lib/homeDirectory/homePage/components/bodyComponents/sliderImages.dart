import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/providers/trekkingPhotoProvider.dart';
import 'package:provider/provider.dart';
import 'imageDescription.dart';

class SliderImages extends StatelessWidget {
  const SliderImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Provider.of<TrekkingPhotoProvider>(context).imgLength,
      options: CarouselOptions(
        height: 450.h,
        pageSnapping: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        viewportFraction: 0.8,
        // enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return ImageDescription(
          trekking:
              Provider.of<TrekkingPhotoProvider>(context).trekkingDesc[index],
        );
      },
    );
  }
}
