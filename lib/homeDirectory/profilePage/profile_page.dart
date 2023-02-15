import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/about_app.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_email.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/change_password.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/ProfileListTile.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/custom_dialog.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/square_settings.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  height: 150.w,
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                          color: ConstantColors.kDarkGreen, width: 4)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: pickedFile != null
                        ? Image.file(
                            pickedFile!,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.all(8.h),
                    ),
                    elevation: const MaterialStatePropertyAll<double>(5),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ConstantColors.kDarkGreen.withOpacity(0.7)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0.r),
                      ),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => bottomSheet(context),
                    );
                  },
                  child: Text(
                    "Change Profile",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              alignment: Alignment.topCenter,
              child:
                  //  Provider.of<CurrentUser>(context).user.userName.isEmpty
                  //     ? Text(
                  //         "User Name",
                  //         style: TextStyle(
                  //             fontSize: 30.sp,
                  //             color: Colors.white,
                  //             overflow: TextOverflow.ellipsis),
                  //         maxLines: 1,
                  //         softWrap: false,
                  //       )
                  //     :
                  Text(
                Provider.of<CurrentUser>(context).user.userName.toUpperCase(),
                style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
                softWrap: false,
              ),
            ),
            SizedBox(height: 20.h),
            ProfileListTile(
              leadingIcon: Icons.email_outlined,
              buttonPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeEmail()));
              },
              title: "Change Your Email",
            ),
            ProfileListTile(
              leadingIcon: Icons.password_outlined,
              buttonPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              title: "Change Your Password",
            ),
            SizedBox(height: 30.h),
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
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: BoxDecoration(
        color: ConstantColors.kLightGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Text(
            'Choose profile photo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 50.h,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 80.w),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 50.h,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 100);

    setState(
      () {
        pickedFile = File(pickedImage!.path);
      },
    );
    Navigator.pop(context);
  }
}

Future uploadImage({
  required String userEmail,
  required String image,
}) async {
  try {
    final response = await http.post(
      Uri.parse(API.updateProfile),
      body: {
        'user_email': userEmail,
        'user_profile': image,
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      print('error1');
      return "Error";
    }
  } catch (e) {
    return 'Error';
  }
}
