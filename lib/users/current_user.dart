import 'package:flutter/material.dart';
import 'package:fyp_project/users/user_preferences.dart';

import '../models/user.dart';

class CurrentUser extends ChangeNotifier {
  User _currentUser = User(0, '', '', '', '');

  User get user => _currentUser;

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  getUserInfo() async {
    User? getUserInfoFromLocalStorage = await RememberUsersPrefs.readUserInfo();
    _currentUser = getUserInfoFromLocalStorage!;
  }
}
