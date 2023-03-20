import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/admin/about_users/user_description.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/providers/admin/users_details_provider.dart';
import 'package:provider/provider.dart';

class AboutUserHome extends StatelessWidget {
  const AboutUserHome({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider = Provider.of<UsersDetailsProvider>(context);
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text("About User's"),
      ),
      body: Column(
        children: [
          Text(
            "Details about the user's",
            style: TextStyle(
              color: ConstantColors.kNeutralSkin,
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
                  child: ListTile(
                    title: Text(
                      UserProvider.usersDetails[index].name.toUpperCase(),
                    ),
                    subtitle: Text(
                      UserProvider.usersDetails[index].id.toString(),
                    ),
                    leading: UserProvider.usersDetails[index].profile != null
                        ? Image.network(
                            "${API.hostConnect}/profilepicture/${UserProvider.usersDetails[index].profile}")
                        : Icon(Icons.person),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30.sp,
                    ),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    tileColor: ConstantColors.kDarkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    onTap: () {
                      final userDesc = UserProvider.usersDetails[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDescription(userDesc: userDesc),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: Provider.of<UsersDetailsProvider>(context)
                  .usersDetails
                  .length,
            ),
          ),
        ],
      ),
    );
  }
}
