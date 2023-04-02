import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/models/trekking_model.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/rules_component.dart';
import '../screens/components/desc_button.dart';

class DestinationDescTrekking extends StatefulWidget {
  final TrekkingModel trekkingModel;
  const DestinationDescTrekking({Key? key, required this.trekkingModel})
      : super(key: key);

  @override
  State<DestinationDescTrekking> createState() =>
      _DestinationDescTrekkingState();
}

class _DestinationDescTrekkingState extends State<DestinationDescTrekking> {
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

  bool isVisible = true;
  int indexActive = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kDarkGreen,
      body: Visibility(
        visible: isVisible,
        replacement: CustomScrollView(
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
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
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
                    Provider.of<TrekkingPhotoFavoriteProvider>(context,
                                listen: false)
                            .trekkingFavorites
                            .contains(widget.trekkingModel.id)
                        ? showSnackBarRemoved(context)
                        : showSnackBarAdded(context);
                    final user =
                        Provider.of<CurrentUser>(context, listen: false).user;
                    Provider.of<TrekkingPhotoFavoriteProvider>(context,
                            listen: false)
                        .toggleFavorites(
                      widget.trekkingModel.id,
                      widget.trekkingModel.title,
                      user.userId,
                    );
                  },
                  icon: Consumer<TrekkingPhotoFavoriteProvider>(
                    builder: (context, value, child) {
                      final isFavorite = value.trekkingFavorites
                          .contains(widget.trekkingModel.id);

                      return isFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border);
                    },
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 270.h,
                width: MediaQuery.of(context).size.width.w,
                child: CarouselSlider.builder(
                  itemCount: widget.trekkingModel.images.length,
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
                          widget.trekkingModel.images[index].imageUrl,
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
                  count: widget.trekkingModel.images.length,
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
                        widget.trekkingModel.title,
                        style: TextStyle(
                            color: ConstantColors.kDarkGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      widget.trekkingModel.intro,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'How to reach?',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.trekkingModel.desc,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'People you may want to contact.',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ConstantColors.kMidGreen,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 0.h),
                        itemCount: 1,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            "Guide - Sirish konda",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text(
                            "9865456214",
                            style: TextStyle(
                              color: ConstantColors.kDarkGreen,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: "9865456214",
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Cannot contact at the moment.');
                              }
                            },
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),

                    DescButtons(
                      title: 'Show in maps',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(milliseconds: 1000),
                            backgroundColor: ConstantColors.kDarkGreen,
                            content: Text(
                              "Currenly this feature is not available",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ConstantColors.kNeutralSkin,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // DescButtons(
                    //   title: 'Give Feedback',
                    //   onPressed: () {
                    //     showModalBottomSheet(
                    //       context: context,
                    //       builder: (context) {
                    //         return const FeedbackBottomSheet();
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: RulesWidget(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
        ),
      ),
    );
  }
}
