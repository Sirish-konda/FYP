// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:card_swiper/card_swiper.dart';
// import '../../constants/constant_colors.dart';
// import '../../models/hiking_model.dart';
// import 'hikingFavorite/show_favorite_container_hiking.dart';

// class WhenNotEmptyHiking extends StatelessWidget {
//   final List<HikingModel> favorites;

//   const WhenNotEmptyHiking({super.key, required this.favorites});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ConstantColors.kLightGreen,
//       body: SizedBox(
//         height: 600.h,
//         child: Swiper(
//           axisDirection: AxisDirection.right,
//           scrollDirection: Axis.horizontal,
//           itemCount: favorites.length,
//           itemWidth: 300.w,
//           loop: false,
//           itemHeight: 400.h,
//           pagination: SwiperPagination(
//               builder: DotSwiperPaginationBuilder(
//                   color: ConstantColors.kNeutralSkin,
//                   activeColor: ConstantColors.kDarkGreen,
//                   activeSize: 15.sp)),
//           layout: SwiperLayout.STACK,
//           itemBuilder: (context, index) {
//             final hiking = favorites[index];
//             return ShowFavoriteContainerHiking(hiking: hiking);
//           },
//         ),
//       ),
//     );
//   }
// }
