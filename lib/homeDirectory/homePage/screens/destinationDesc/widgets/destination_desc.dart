import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/components/feedbackScreen/feedback_bottomsheet.dart';
import 'package:fyp_project/homeDirectory/homePage/screens/destinationDesc/components/mapsScreen/maps_screen.dart';
import 'package:fyp_project/models/trekking_model.dart';

import '../components/desc_button.dart';

class DestinationDesc extends StatefulWidget {
  final TrekkingModel trekkingModel;
  const DestinationDesc({Key? key, required this.trekkingModel})
      : super(key: key);

  @override
  State<DestinationDesc> createState() => _DestinationDescState();
}

class _DestinationDescState extends State<DestinationDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return Card(
                      color: Colors.black,
                      margin: EdgeInsets.only(left: 7.w, right: 7.w),
                      elevation: 20,
                      child: Image.asset(
                        widget.trekkingModel.imagePath,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250.h,
                    autoPlay: true,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
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
                        'How to reach?',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.trekkingModel.desc,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                      DescButtons(
                        title: 'Show in maps',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapsScreen()));
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

// body: SafeArea(
//   bottom: false,
//   child: SingleChildScrollView(
//     child: Container(
//       height: MediaQuery.of(context).size.height.h,
//       width: MediaQuery.of(context).size.width.w,
//       color: ConstantColors.kLightGreen,
//       child: Column(
//         children: [
//           ListTile(
//             iconColor: Colors.black,
//             contentPadding: EdgeInsets.zero,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_rounded,
//                 size: 25.sp,
//               ),
//             ),
//             title: Center(
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                       fontSize: 25.sp, fontWeight: FontWeight.w700),
//                   children: const [
//                     TextSpan(
//                       text: 'About ',
//                       style:
//                           TextStyle(color: ConstantColors.kNeutralSkin),
//                     ),
//                     TextSpan(
//                       text: 'Location',
//                       style: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             trailing: IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.favorite_border,
//                 size: 25.sp,
//               ),
//             ),
//           ),
//           Image.asset(widget.trekkingModel.imagePath),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.only(top: 20.h),
//               padding: EdgeInsets.all(20.h),
//               decoration: BoxDecoration(
//                 color: ConstantColors.kNeutralSkin,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.h),
//                   topRight: Radius.circular(30.h),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         widget.trekkingModel.title,
//                         style: TextStyle(
//                             color: ConstantColors.kDarkGreen,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30.sp,
//                             decoration: TextDecoration.underline),
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     Text(
//                       'How to reach?',
//                       style: TextStyle(
//                           fontSize: 20.sp, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       widget.trekkingModel.desc,
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                       ),
//                     ),
//                     DescButtons(
//                       title: 'Show in maps',
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MapsScreen()));
//                       },
//                     ),
//                     DescButtons(
//                       title: 'Give Feedback',
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) {
//                             return const FeedbackBottomSheet();
//                           },
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
