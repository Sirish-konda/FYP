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

  updateUserProfile(String profileUrl) {
    _currentUser.userProfile = profileUrl;
    notifyListeners();
  }

  updateUserEmail(String newEmail) {
    _currentUser.userEmail = newEmail;
    notifyListeners();
  }

  updateUserPassword(String newPassword) {
    _currentUser.userEmail = newPassword;
    notifyListeners();
  }

  // getUserInfo() async {
  //   User? getUserInfoFromLocalStorage = await RememberUsersPrefs.readUserInfo();
  //   _currentUser = getUserInfoFromLocalStorage!;
  //   notifyListeners();
  // }
}

//esma user_preferences ma ani login ma comment xa..
