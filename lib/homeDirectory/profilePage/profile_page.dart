import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/about_app.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_email.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_password.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: ConstantColors.kDarkGreen,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 70.r,
                child: Image.asset('assets/images/profile.png'),
              ),
              Text(
                "User Name",
                style: TextStyle(
                  fontSize: 35.sp,
                  color: Colors.white,
                ),
              ),
              ProfileSettings(
                title: 'Change your email',
                buttonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeEmail()));
                },
              ),
              ProfileSettings(
                title: 'Change your password',
                buttonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
              ),
              ProfileSettings(
                title: 'About the app',
                buttonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutApp()));
                },
              ),
              ProfileSettings(
                title: 'Log out',
                buttonPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
