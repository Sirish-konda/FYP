import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/components/desc_button.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/components/feedbackScreen/feedback_bottomsheet.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/components/mapsScreen/maps_screen.dart';
import 'package:fyp_project/models/hikking_model.dart';
import 'package:fyp_project/providers/hikingPhotoProvider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DestinationDescHiking extends StatefulWidget {
  final HikingModel hikingModel;
  const DestinationDescHiking({Key? key, required this.hikingModel})
      : super(key: key);

  @override
  State<DestinationDescHiking> createState() => _DestinationDescHikingState();
}

class _DestinationDescHikingState extends State<DestinationDescHiking> {
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
              IconButton(
                onPressed: () {
                  setState(() {
                    Provider.of<HikingPhotoProvider>(context, listen: false)
                        .toggleFavorites(widget.hikingModel.id);
                  });
                },
                icon: widget.hikingModel.isFavorited
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270.h,
              width: MediaQuery.of(context).size.width.w,
              child: CarouselSlider.builder(
                itemCount: widget.hikingModel.images.length,
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
                        widget.hikingModel.images[index].imageUrl,
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
                count: widget.hikingModel.images.length,
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
                      widget.hikingModel.title,
                      style: TextStyle(
                          color: ConstantColors.kDarkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.hikingModel.intro,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'How to reach?',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.hikingModel.desc,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  DescButtons(
                    title: 'Show in maps',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapsScreen()));
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
