import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:http/http.dart' as http;

class HikingPhotoFavoriteProvider extends ChangeNotifier {
  final List<int> hikingFavorites = [];

  void toggleFavorites(
    int hikingId,
    String hikingName,
    int userId,
  ) {
    toggleFavoritesHike(
      hikingId,
      hikingName,
      userId,
    );
  }

  void toggleFavoritesHike(
    int hikingId,
    String hikingName,
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.favoriteHike),
        body: jsonEncode(
          {
            'user_id': userId,
            'hike_id': hikingId,
            'hike_name': hikingName,
          },
        ),
      );

      print(res.statusCode);
      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);

        if (resFavoriteBody['result'] == true) {
          if (hikingFavorites.contains(hikingId)) {
            hikingFavorites.remove(hikingId);
          } else {
            hikingFavorites.add(hikingId);
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      print(e);
    }
  }

  void getFavoriteHike(
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.getFavoriteHike),
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
            hikingFavorites.add(
              int.parse(
                favorite['hike_id'],
              ),
            );
          }

          notifyListeners();
        } else {}
      }
    } catch (e) {
      print("sirish9 + $e");
    }
  }

  void reset() {
    hikingFavorites.clear();
    notifyListeners();
  }
}
