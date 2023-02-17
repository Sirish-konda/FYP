import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'hikingFavorite/favorite_hike_screen.dart';
import 'trekkingFavorite/favorite_trek_screen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {
  List<String> items = ["Trek's", "Hike's"];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Favorite"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: ConstantColors.kDarkGreen.withOpacity(0.3),
            ),
            // height: 50.h,
            width: 300.w,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.h),
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: kDefaultIconDarkColor,
                    labelStyle: TextStyle(fontSize: 20.sp),
                    indicator: BoxDecoration(
                        color: ConstantColors.kDarkGreen,
                        borderRadius: BorderRadius.circular(10.r)),
                    labelColor: ConstantColors.kNeutralSkin,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: "Hike's"),
                      Tab(text: "Trek's"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                FavoriteHikeScreen(),
                FavoriteTrekScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//second

// Scaffold(
//       backgroundColor: ConstantColors.kLightGreen,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Text("Favorite"),
//       ),
//       body: Center(
//         child: SizedBox(
//           // width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 60.h,
//                 width: 200.h,
//                 // width: double.infinity,
//                 child: ListView.builder(
//                     itemCount: items.length,
//                     physics: const BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 current = index;
//                               });
//                             },
//                             child: AnimatedContainer(
//                               duration: const Duration(milliseconds: 500),
//                               margin: EdgeInsets.all(5.h),
//                               width: 100.w,
//                               height: 45.h,
//                               decoration: BoxDecoration(
//                                 color: current == index
//                                     ? ConstantColors.kDarkGreen
//                                     : ConstantColors.kMidGreen.withOpacity(0.3),
//                                 borderRadius: current == index
//                                     ? BorderRadius.circular(20.r)
//                                     : BorderRadius.circular(10.r),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   items[index],
//                                   style: TextStyle(
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: current == index
//                                         ? Colors.white
//                                         : ConstantColors.kNeutralSkin
//                                             .withOpacity(0.6),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Visibility(
//                               visible: current == index,
//                               child: Container(
//                                 width: 5.w,
//                                 height: 5.h,
//                                 decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ConstantColors.kNeutralSkin),
//                               ))
//                         ],
//                       );
//                     }),
//               ),
//               Container()
//             ],
//           ),
//         ),
//       ),
//     );

//first
