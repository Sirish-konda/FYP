import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class RememberUsersPrefs {
  static Future<void> storeUserInfo(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

  //get/read user info
  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    log(userInfo.toString());
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);

      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
}
