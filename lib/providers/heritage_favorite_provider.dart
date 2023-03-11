import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:http/http.dart' as http;

class HeritagePhotoFavoriteProvider extends ChangeNotifier {
  final List<int> heritageFavorites = [];

  void toggleFavorites(
    int siteId,
    String siteName,
    int userId,
  ) {
    toggleFavoritesSite(
      siteId,
      siteName,
      userId,
    );
  }

  void toggleFavoritesSite(
    int siteId,
    String siteName,
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.favoriteSite),
        body: jsonEncode(
          {
            'user_id': userId,
            'site_id': siteId,
            'site_name': siteName,
          },
        ),
      );

      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);

        if (resFavoriteBody['result'] == true) {
          if (heritageFavorites.contains(siteId)) {
            heritageFavorites.remove(siteId);
          } else {
            heritageFavorites.add(siteId);
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  void getFavoriteSite(
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.getFavoriteSite),
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
            heritageFavorites.add(
              int.parse(
                favorite['site_id'],
              ),
            );
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  void reset() {
    heritageFavorites.clear();
    notifyListeners();
  }
}
