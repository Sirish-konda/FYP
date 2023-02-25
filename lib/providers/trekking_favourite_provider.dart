import 'dart:convert';

import 'package:flutter/material.dart';

import '../apiConnection/api_connection.dart';
import 'package:http/http.dart' as http;

class TrekkingPhotoFavouriteProvider extends ChangeNotifier {
  final List<int> favourites = [];

  void toggleFavorites(
    int trekkingId,
    String trekkingName,
    int userId,
  ) {
    // final trekkingIndex = ;

    toogleFavoriteTrek(trekkingId, trekkingName, userId);

    // notifyListeners();
  }

  void toogleFavoriteTrek(
    int trekkingId,
    String trekkingName,
    int userId,
  ) async {
    try {
      // print('userId: $userId');
      var res = await http.post(
        Uri.parse(API.favoriteTrek),
        body: jsonEncode({
          'user_id': userId,
          'trek_id': trekkingId,
          'trek_name': trekkingName,
        }),
      );

      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);

        if (resFavoriteBody['result'] == true) {
          if (favourites.contains(trekkingId)) {
            favourites.remove(trekkingId);
          } else {
            favourites.add(trekkingId);
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      print(e);
    }
  }

  void getFavoriteTrek(
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.getFavoriteTrek),
        body: jsonEncode(
          {
            'user_id': userId,
          },
        ),
      );

      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);
        if (resFavoriteBody['success'] == true) {
          List<dynamic> userFavorites = resFavoriteBody['userFavorite'];
          for (var favorite in userFavorites) {
            favourites.add(int.parse(favorite['trek_id']));
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {}
  }
}
