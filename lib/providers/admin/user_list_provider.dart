import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/models/user.dart';
import 'package:http/http.dart' as http;

import '../../apiConnection/api_connection.dart';

class UserListProvider extends ChangeNotifier {
  List<User> _userList = [];

  List<User> get userList => _userList;

  Future<void> getUsers() async {
    try {
      final response = await http.get(Uri.parse(API.getUserList));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // Converts the JSON response into a list of UsersDetailsModel objects
          var userDetailsJson = responseBody['usersList'];
          _userList = List<User>.from(
            userDetailsJson.map((json) => User.fromJson(json)).toList(),
          );
          notifyListeners();
        } else {
          throw Exception('No users');
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      final response = await http.post(
        Uri.parse(API.adminDeleteUser),
        body: jsonEncode(
          {
            'user_id': userId,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // Removes the user from the list of users
          _userList.removeWhere((item) => item.userId == userId);
          // Displays a toast message to confirm that the user has been deleted
          Fluttertoast.showToast(msg: "User deleted");
          notifyListeners();
        } else {}
      }
    } catch (e) {
      // Displays a toast message if there's an error while deleting the user
      Fluttertoast.showToast(msg: "Problem with deleteUser $e");
    }
  }
}
