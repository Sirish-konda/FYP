import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/show_favorite_container.dart';
import 'package:fyp_project/models/trekking_model.dart';
import '../../../constants/constant_colors.dart';

class WhenNotEmpty extends StatelessWidget {
  List<TrekkingModel> favorites;
  WhenNotEmpty({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Favorite"),
            backgroundColor: ConstantColors.kDarkGreen,
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final trekking = favorites[index];
                return ShowFavoriteContainer(trekking: trekking);
              },
            ),
          )
        ],
      ),
    );
  }
}
