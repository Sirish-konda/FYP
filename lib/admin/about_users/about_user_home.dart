import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/admin/about_users/user_description.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/providers/admin/user_list_provider.dart';
import 'package:provider/provider.dart';

class AboutUserHome extends StatefulWidget {
  const AboutUserHome({super.key});

  @override
  State<AboutUserHome> createState() => _AboutUserHomeState();
}

class _AboutUserHomeState extends State<AboutUserHome> {
  @override
  void initState() {
    context.read<UserListProvider>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserListProvider>(context);

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
                      userProvider.userList[index].userName.toUpperCase(),
                    ),
                    subtitle: Text(
                      userProvider.userList[index].userId.toString(),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: userProvider
                                  .userList[index].userProfile !=
                              ""
                          ? NetworkImage(
                              "${API.hostConnect}/profilepicture/${userProvider.userList[index].userProfile}",
                            )
                          : const NetworkImage(
                              "${API.hostConnect}/profilepicture/profile.png"),
                    ),
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
                      final userDesc = userProvider.userList[index].userId;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDescription(userId: userDesc),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: Provider.of<UserListProvider>(context).userList.length,
            ),
          ),
        ],
      ),
    );
  }
}
