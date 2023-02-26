import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/providers/heritage_photo_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/constant_colors.dart';
import '../../../models/heritage_model.dart';
import '../../../providers/hiking_favorite_provider.dart';
import '../screens/components/desc_button.dart';
import '../screens/components/feedbackScreen/feedback_bottomsheet.dart';
import '../screens/components/mapsScreen/maps_screen.dart';

class DestinationDescHeritage extends StatefulWidget {
  final HeritageModel heritageModel;
  const DestinationDescHeritage({super.key, required this.heritageModel});

  @override
  State<DestinationDescHeritage> createState() =>
      _DestinationDescHeritageState();
}

class _DestinationDescHeritageState extends State<DestinationDescHeritage> {
  showSnackBarAdded(BuildContext context) {
    final addedSnackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ConstantColors.kLightGreen,
      content: Center(
        child: Text(
          'Added to favorite',
          style: TextStyle(fontSize: 18.sp, color: ConstantColors.kNeutralSkin),
        ),
      ),
      duration: const Duration(milliseconds: 800),
    );
    ScaffoldMessenger.of(context).showSnackBar(addedSnackBar);
  }

  showSnackBarRemoved(BuildContext context) {
    final removedSnackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          "Removed from favorite",
          style: TextStyle(
            fontSize: 18.sp,
            color: ConstantColors.kNeutralSkin,
          ),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      duration: const Duration(milliseconds: 800),
    );
    ScaffoldMessenger.of(context).showSnackBar(removedSnackBar);
  }

  int indexActive = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kDarkGreen,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true, //expandedHeight: 500,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
            backgroundColor: ConstantColors.kLightGreen,
            title: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                children: const [
                  TextSpan(
                    text: 'About ',
                    style: TextStyle(color: ConstantColors.kNeutralSkin),
                  ),
                  TextSpan(
                    text: 'Location',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // IconButton(
              // onPressed: () {
              // Provider.of<HeritagePhotoProvider>(context,
              //             listen: false)
              //         .hikingFavorites
              //         .contains(widget.hikingModel.id)
              //     ? showSnackBarRemoved(context)
              //     : showSnackBarAdded(context);

              // final user =
              //     Provider.of<CurrentUser>(context, listen: false).user;
              // Provider.of<HikingPhotoFavoriteProvider>(context,
              //         listen: false)
              //     .toggleFavorites(
              //   widget.hikingModel.id,
              //   widget.hikingModel.title,
              //   user.userId,
              // );
              // },
              // icon: Consumer<HikingPhotoFavoriteProvider>(
              //   builder: (context, value, child) {
              //     final isFavorite =
              //         value.hikingFavorites.contains(widget.hikingModel.id);

              //     return isFavorite
              //         ? const Icon(Icons.favorite, color: Colors.red)
              //         : const Icon(Icons.favorite_border);
              //   },
              // ),
              //),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270.h,
              width: MediaQuery.of(context).size.width.w,
              child: CarouselSlider.builder(
                itemCount: widget.heritageModel.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: ConstantColors.kLightGreen),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.heritageModel.images[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexActive = index;
                    });
                  },
                  height: 250.h,
                  autoPlay: true,
                  viewportFraction: 0.8,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: indexActive,
                count: widget.heritageModel.images.length,
                effect: const WormEffect(
                  spacing: 10.0,
                  activeDotColor: ConstantColors.kNeutralSkin,
                  dotColor: ConstantColors.kLightGreen,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8.h)),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: ConstantColors.kNeutralSkin,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.h),
                  topRight: Radius.circular(30.h),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.heritageModel.title,
                      style: TextStyle(
                          color: ConstantColors.kDarkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.heritageModel.intro,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'How to reach?',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.heritageModel.desc,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  DescButtons(
                    title: 'Show in maps',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapsScreen(),
                        ),
                      );
                    },
                  ),
                  DescButtons(
                    title: 'Give Feedback',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const FeedbackBottomSheet();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}