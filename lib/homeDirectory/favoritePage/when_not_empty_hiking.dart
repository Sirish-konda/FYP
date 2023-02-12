import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/show_favorite_container_hiking.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/show_favorite_container.dart';
import 'package:fyp_project/models/hikking_model.dart';

import '../../constants/constant_colors.dart';

class WhenNotEmptyHiking extends StatelessWidget {
  final List<HikingModel> favorites;

  WhenNotEmptyHiking({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final hiking = favorites[index];
                return ShowFavoriteContainerHiking(hiking: hiking);
              },
            ),
          )
        ],
      ),
    );
  }
}
