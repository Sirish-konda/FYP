import 'package:flutter/material.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/favoritePage/hikingFavorite/when_not_empty_hiking.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/homeDirectory/favoritePage/trekkingFavorite/when_not_empty_trekking.dart';
import 'package:provider/provider.dart';

import '../../../providers/hikingPhotoProvider.dart';

class FavoriteHikeScreen extends StatefulWidget {
  const FavoriteHikeScreen({super.key});

  @override
  State<FavoriteHikeScreen> createState() => _FavoriteHikeScreenState();
}

class _FavoriteHikeScreenState extends State<FavoriteHikeScreen> {
  @override
  Widget build(BuildContext context) {
    final hikingProvider = Provider.of<HikingPhotoProvider>(context);
    final favorites = hikingProvider.hikingDesc
        .where((trekking) => trekking.isFavorited)
        .toList();

    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmptyHiking(favorites: favorites);
  }
}
