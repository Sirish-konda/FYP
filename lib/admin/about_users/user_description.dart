import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/providers/admin/user_list_provider.dart';
import 'package:fyp_project/providers/admin/users_details_provider.dart';
import 'package:provider/provider.dart';
import '../../apiConnection/api_connection.dart';

class UserDescription extends StatefulWidget {
  final int userId;
  const UserDescription({super.key, required this.userId});

  @override
  State<UserDescription> createState() => _UserDescriptionState();
}

class _UserDescriptionState extends State<UserDescription> {
  @override
  void initState() {
    context.read<UsersDetailsProvider>().fetchUsers(widget.userId);
    super.initState();
  }

  showSnackBarDeleteFeedback(BuildContext context) {
    final addedSnackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ConstantColors.kLightGreen,
      content: Column(
        children: [
          Text(
            "Do you want to delete the user's feedback?",
            style:
                TextStyle(fontSize: 18.sp, color: ConstantColors.kNeutralSkin),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Provider.of<UsersDetailsProvider>(context, listen: false)
                      .deleteFeedback(widget.userId);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Provider.of<UsersDetailsProvider>(context, listen: false)
                      .setUsersDetails();
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ConstantColors.kDarkGreen,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Text('No'),
              ),
            ],
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(addedSnackBar);
  }

  showSnackBarDeleteUser(BuildContext context) {
    final addedSnackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 2500),
      backgroundColor: ConstantColors.kLightGreen,
      content: Column(
        children: [
          Text(
            "Do you want to delete this user?",
            style:
                TextStyle(fontSize: 18.sp, color: ConstantColors.kNeutralSkin),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Provider.of<UserListProvider>(context, listen: false)
                      .deleteUser(widget.userId);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ConstantColors.kDarkGreen,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Text('No'),
              ),
            ],
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(addedSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<UsersDetailsProvider>(context).usersDetails;
    return Provider.of<UsersDetailsProvider>(context).usersDetails.id != null
        ? Scaffold(
            backgroundColor: ConstantColors.kLightGreen,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Provider.of<UsersDetailsProvider>(context, listen: false)
                      .setUsersDetails();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              centerTitle: true,
              backgroundColor: ConstantColors.kDarkGreen,
              title: Text(
                "User Id - ${userProvider.id}",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSnackBarDeleteUser(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 100.w,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                          color: ConstantColors.kDarkGreen, width: 4),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: userProvider.profile != null
                          ? Image.network(
                              "${API.hostConnect}/profilepicture/${userProvider.profile}",
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.person,
                              size: 50.h,
                            ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    userProvider.name!.toUpperCase(),
                    style: TextStyle(
                      color: ConstantColors.kNeutralSkin,
                      decoration: TextDecoration.underline,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    userProvider.email!,
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(height: 8.h),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 500.h,
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 10.h,
                        right: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: ConstantColors.kDarkGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${userProvider.name}'s feedback on the app"
                                .toUpperCase(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ConstantColors.kNeutralSkin,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          ViewUserFeedback(
                            title: "User's rating for the app",
                            icon: Icons.star_border,
                            answer: userProvider.rating!,
                          ),
                          SizedBox(height: 20.h),
                          ViewUserFeedback(
                            icon: Icons.sentiment_very_satisfied_outlined,
                            title: "User's satistaction",
                            answer: userProvider.satisfaction!,
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 150.h,
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                              color: ConstantColors.kNeutralSkin,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.feedback_outlined,
                                      size: 23.h,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "User's Feedback",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    Icon(
                                      Icons.arrow_downward_rounded,
                                      size: 23.h,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.h),
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.h),
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Text(
                                      userProvider.feedback!,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: () {
                              showSnackBarDeleteFeedback(context);
                            },
                            child: Container(
                              width: 210.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.red.shade900,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.delete_forever_outlined,
                                    size: 23.h,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Delete user's feedback",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: ConstantColors.kLightGreen,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Provider.of<UsersDetailsProvider>(context, listen: false)
                      .setUsersDetails();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              centerTitle: true,
              backgroundColor: ConstantColors.kDarkGreen,
              title: Text(
                "User Id - ${widget.userId}",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSnackBarDeleteUser(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Center(
              child: Text(
                "The user hasn't given any feedback yet.",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: ConstantColors.kNeutralSkin,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}

class ViewUserFeedback extends StatelessWidget {
  final IconData icon;
  final String title;
  final String answer;
  const ViewUserFeedback({
    super.key,
    required this.icon,
    required this.title,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantColors.kNeutralSkin,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 23.h,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        trailing: Text(
          answer,
          style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 14.sp),
        ),
        contentPadding: EdgeInsets.all(20.r),
      ),
    );
  }
}
