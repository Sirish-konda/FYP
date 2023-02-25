import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/homeDirectory/favoritePage/trekkingFavorite/when_not_empty_trekking.dart';
import 'package:fyp_project/models/trekking_model.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/providers/trekking_photo_provider.dart';
import 'package:provider/provider.dart';

class FavoriteTrekScreen extends StatefulWidget {
  const FavoriteTrekScreen({super.key});

  @override
  State<FavoriteTrekScreen> createState() => _FavoriteTrekScreenState();
}

class _FavoriteTrekScreenState extends State<FavoriteTrekScreen> {
  @override
  Widget build(BuildContext context) {
    final trekkingProvider = Provider.of<TrekkingPhotoProvider>(context);

    List<TrekkingModel> favorites = [];

    final favoriteTrekIds =
        context.watch<TrekkingPhotoFavoriteProvider>().trekkingFavorites;

    for (int i = 0; i < favoriteTrekIds.length; i++) {
      final favTrek = trekkingProvider.trekkingDesc.firstWhere(
        (element) => element.id == favoriteTrekIds[i],
      );
      favorites.add(favTrek);
    }

    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmptyTrekking(favorites: favorites);
  }
}
