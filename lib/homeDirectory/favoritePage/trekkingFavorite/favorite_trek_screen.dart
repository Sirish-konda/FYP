import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/homeDirectory/favoritePage/trekkingFavorite/when_not_empty_trekking.dart';
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
    final favorites = trekkingProvider.trekkingDesc
        .where((trekking) => trekking.isFavorited)
        .toList();

    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmptyTrekking(favorites: favorites);
  }
}
