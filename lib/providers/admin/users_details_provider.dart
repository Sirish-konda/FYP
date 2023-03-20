import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/models/admin/users_details_model.dart';
import 'package:http/http.dart' as http;

class UsersDetailsProvider extends ChangeNotifier {
  List<UsersDetailsModel> _usersDetails = [];

  List<UsersDetailsModel> get usersDetails => _usersDetails;

  // Future<void> fetchUsers() async {
  //   final response = await http.get(
  //     Uri.parse(API.adminViewDetails),
  //   );

  //   if (response.statusCode == 200) {
  //     // final jsonList = json.decode(response.body)['usersDetails'];
  //     // _usersDetails =
  //     //     jsonList.map((json) => UsersDetailsModel.fromJson(json)).toList();
  //     // print(_usersDetails);

  //     var responseBody = jsonDecode(response.body);

  //     if (responseBody['success'] == true) {
  //       print(responseBody['userDetails']);
  //       // final List<dynamic> jsonList = responseBody['usersDetails'];
  //       // jsonList.map((json) => UsersDetailsModesl.fromJson(json)).toList();
  //       notifyListeners();
  //     } else {}
  //   } else {
  //     throw Exception('Failed to load users');
  //   }
  // }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(API.adminViewDetails));

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        var userDetailsJson = responseBody['usersDetails'];
        _usersDetails = List<UsersDetailsModel>.from(userDetailsJson
            .map((json) => UsersDetailsModel.fromJson(json))
            .toList());
        notifyListeners();
      } else {
        throw Exception('Failed to load users');
      }
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> deleteFeedback(int userId, UsersDetailsModel index) async {
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
          _usersDetails.remove(index);
          notifyListeners();
        } else {}
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser(int userId, UsersDetailsModel index) async {
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
        print('e');
        if (responseBody['success'] == true) {
          print('object');
          _usersDetails.remove(index);
          Fluttertoast.showToast(msg: "User deleted");
          notifyListeners();
        } else {}
      }
    } catch (e) {
      print(e);
    }
  }
}
