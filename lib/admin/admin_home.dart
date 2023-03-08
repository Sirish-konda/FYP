import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/admin/about_users/about_user_home.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/square_settings.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Mero "),
        backgroundColor: ConstantColors.kDarkGreen,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 20.h,
          right: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the system!',
              style: TextStyle(
                fontSize: 28.sp,
                color: ConstantColors.kNeutralSkin,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Dear admin",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: ConstantColors.kNeutralSkin),
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SquareSettings(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUserHome(),
                          ),
                        );
                      },
                      title: "Abour Users",
                      icon: Icons.person_outline_rounded),
                  SquareSettings(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: "Log out",
                      icon: Icons.logout_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
