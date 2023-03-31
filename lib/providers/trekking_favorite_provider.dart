import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../apiConnection/api_connection.dart';
import 'package:http/http.dart' as http;

class TrekkingPhotoFavoriteProvider extends ChangeNotifier {
  final List<int> trekkingFavorites = [];

  void toggleFavorites(
    int trekkingId,
    String trekkingName,
    int userId,
  ) {
    toggleFavoriteTrek(
      trekkingId,
      trekkingName,
      userId,
    );
  }

  void toggleFavoriteTrek(
    int trekkingId,
    String trekkingName,
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.favoriteTrek),
        body: jsonEncode(
          {
            'user_id': userId,
            'trek_id': trekkingId,
            'trek_name': trekkingName,
          },
        ),
      );

      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);

        if (resFavoriteBody['result'] == true) {
          if (trekkingFavorites.contains(trekkingId)) {
            trekkingFavorites.remove(trekkingId);
          } else {
            trekkingFavorites.add(trekkingId);
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
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
            trekkingFavorites.add(
              int.parse(
                favorite['trek_id'],
              ),
            );
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  void reset() {
    trekkingFavorites.clear();
  }
}
