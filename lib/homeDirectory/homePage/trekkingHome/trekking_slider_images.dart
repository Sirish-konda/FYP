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
          Row(
            children: [
              const Spacer(
                flex: 2,
              ),
              const PopularTitle(
                title: "Popular Trek's",
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // contentPadding: EdgeInsets.zero,
                        actionsPadding:
                            EdgeInsets.only(top: 0.h, left: 10.h, right: 10.h),
                        scrollable: true,
                        title: Text(
                          "Conditions to follow while going on a trek in Nepal:",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        content: Text(
                          '''
                1. Trekkers should respect local customs and traditions and must not indulge in any activity that goes against the established norms and culture of the society.
                
                2. Individual trekking in Restricted Areas is strictly forbidden. There should be minimum two trekkers.
                
                3. Daily remuneration, safety gears and appropriate clothes, Personal Accident insurance must be provided to Nepali citizen accompanying travel group as guide/porter/any other supporting roles.
                
                4. Trekkers should trek only in the specified or designated route as per the Trekking Permit. They are not allowed to change route. Or concerned trekking agency/trekking guide accompanying the group must not let trekkers change the route.
                
                5. Trekkers should comply with instructions given by authorized Officials in trekking zone (Restricted Area).''',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5.sp,
                              fontSize: 12.sp),
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    ConstantColors.kMidGreen,
                                backgroundColor: ConstantColors.kLightGreen,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: ConstantColors.kNeutralSkin,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.info_outline_rounded,
                  size: 20.h,
                ),
              ),
              const Spacer(),
            ],
          ),
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
