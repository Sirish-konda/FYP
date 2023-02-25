import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/hikingFavorite/when_not_empty_hiking.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/models/hiking_model.dart';
import 'package:fyp_project/providers/hiking_favorite_provider.dart';
import 'package:provider/provider.dart';
import '../../../providers/hiking_photo_provider.dart';

class FavoriteHikeScreen extends StatefulWidget {
  const FavoriteHikeScreen({super.key});

  @override
  State<FavoriteHikeScreen> createState() => _FavoriteHikeScreenState();
}

class _FavoriteHikeScreenState extends State<FavoriteHikeScreen> {
  @override
  Widget build(BuildContext context) {
    final hikingProvider = Provider.of<HikingPhotoProvider>(context);

    List<HikingModel> favorites = [];

    final favoriteHikeIds =
        context.watch<HikingPhotoFavoriteProvider>().hikingFavorites;

    for (int i = 0; i < favoriteHikeIds.length; i++) {
      final favHike = hikingProvider.hikingDesc.firstWhere(
        (element) => element.id == favoriteHikeIds[i],
      );
      favorites.add(favHike);
    }

    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmptyHiking(favorites: favorites);
  }
}
