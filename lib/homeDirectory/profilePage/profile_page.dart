import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/about_app.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_email.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_password.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/custom_dialog.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/square_settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SquareSettings(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutApp(),
                            ),
                          );
                        },
                        title: 'About us',
                        icon: Icons.info_outline,
                      ),
                      SquareSettings(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const CustomDialog();
                              },
                            );
                          },
                          title: 'Log out',
                          icon: Icons.logout_outlined)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
