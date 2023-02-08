import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_empty.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_not_empty.dart';
import 'package:provider/provider.dart';
import '../../providers/trekkingPhotoProvider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trekkingProvider = Provider.of<TrekkingPhotoProvider>(context);
    final favorites = trekkingProvider.trekkingDesc
        .where((trekking) => trekking.isFavorited)
        .toList();
    return favorites.isEmpty
        ? const WhenEmpty()
        : WhenNotEmpty(favorites: favorites);
  }
}
