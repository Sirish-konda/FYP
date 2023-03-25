import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/models/admin/users_details_model.dart';
import 'package:http/http.dart' as http;

class UsersDetailsProvider extends ChangeNotifier {
  UsersDetailsModel _usersDetails = UsersDetailsModel();

  UsersDetailsModel get usersDetails => _usersDetails;

  void setUsersDetails() {
    _usersDetails = UsersDetailsModel();
  }

  // Fetches the list of users from the API
  Future<void> fetchUsers(int userId) async {
    try {
      final response = await http.post(
        Uri.parse(API.adminViewDetails),
        body: jsonEncode(
          {
            'user_id': userId,
          },
        ),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          if (responseBody["usersDetails"] != null) {
            UsersDetailsModel userDetails =
                UsersDetailsModel.fromJson(responseBody["usersDetails"]);

            _usersDetails = userDetails;
            notifyListeners();
          } else {
            
          }
        } else {
          throw Exception('Failed to load users');
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
      // Displays a toast message if there's an error while fetching the list of users
      Fluttertoast.showToast(msg: "Problem with fetchUsers() $e");
    }
  }

  // Deletes a feedback from a user
  Future<void> deleteFeedback(int userId) async {
    try {
      final response = await http.post(
        Uri.parse(API.adminDeleteFeedback),
        body: jsonEncode(
          {
            'user_id': userId,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // Removes the feedback from the user's details list
          // _usersDetails.removeWhere((item) => item.user index);
          notifyListeners();
        } else {}
      }
    } catch (e) {
      // Displays a toast message if there's an error while deleting the feedback
      Fluttertoast.showToast(msg: "Problem with deleteFeedback $e");
    }
  }
}
