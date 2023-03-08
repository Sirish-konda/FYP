import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/siteFavorite/when_not_empty_site.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/models/heritage_model.dart';
import 'package:fyp_project/providers/heritage_favorite_provider.dart';
import 'package:fyp_project/providers/heritage_photo_provider.dart';
import 'package:provider/provider.dart';

class FavoriteSiteScreen extends StatelessWidget {
  const FavoriteSiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heritageProvider = Provider.of<HeritagePhotoProvider>(context);
    List<HeritageModel> favorites = [];

    final favoriteSiteIds =
        context.watch<HeritagePhotoFavoriteProvider>().heritageFavorites;

    for (int i = 0; i < favoriteSiteIds.length; i++) {
      final favSite = heritageProvider.heritageDesc.firstWhere(
        (element) => element.id == favoriteSiteIds[i],
      );
      favorites.add(favSite);
    }
    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmptySite(favorites: favorites);
  }
}
