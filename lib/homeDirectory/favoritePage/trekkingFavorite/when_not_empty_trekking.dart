import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/homeDirectory/favoritePage/trekkingFavorite/show_favorite_container_trekking.dart';
import 'package:fyp_project/models/trekking_model.dart';
import '../../../constants/constant_colors.dart';

class WhenNotEmptyTrekking extends StatelessWidget {
  final List<TrekkingModel> favorites;
  const WhenNotEmptyTrekking({Key? key, required this.favorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: SizedBox(
        height: 600.h,
        child: Swiper(
          axisDirection: AxisDirection.right,
          scrollDirection: Axis.horizontal,
          itemCount: favorites.length,
          itemWidth: 300.w,
          loop: true,
          itemHeight: 400.h,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: ConstantColors.kNeutralSkin,
                activeColor: ConstantColors.kDarkGreen,
                activeSize: 15.sp),
          ),
          layout: SwiperLayout.STACK,
          itemBuilder: (context, index) {
            final trekking = favorites[index];
            return ShowFavoriteContainerTrekking(trekking: trekking);
          },
        ),
      ),
    );
  }
}
