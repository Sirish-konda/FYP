import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/change_text_field.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';
import '../../../apiConnection/api_connection.dart';
import '../../../constants/constant_colors.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final oldPasswordController = TextEditingController();

  final newPasswordController = TextEditingController();

  final confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> updatePassword({
      required String oldUserPassword,
      required String newUserPassword,
    }) async {
      try {
        var response = await http.post(
          Uri.parse(API.updatePassword),
          body: {
            'user_email':
                Provider.of<CurrentUser>(context, listen: false).user.userEmail,
            'current_password': oldUserPassword,
            'new_password': newUserPassword,
          },
        );

        if (response.statusCode == 200) {
          var resBody = jsonDecode(response.body);
          if (resBody['success'] == true) {
            Fluttertoast.showToast(
                msg: 'Your password has been succesfully changed.',
                backgroundColor: Colors.green,
                fontSize: 16);
            Provider.of<CurrentUser>(context, listen: false)
                .updateUserPassword(newUserPassword);

            Navigator.pop(context);
          } else {
            Fluttertoast.showToast(
                msg: 'Error occured try again',
                backgroundColor: Colors.red,
                fontSize: 16);
          }
        }
      } catch (e) {
        Fluttertoast.showToast(msg: '$e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.kDarkGreen,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        height: 500,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Change your password',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    ChangeTextField(
                        title: 'Old Password',
                        controller: oldPasswordController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required.";
                          }
                          String password =
                              Provider.of<CurrentUser>(context, listen: false)
                                  .user
                                  .userPassword;
                          var hashValue = md5
                              .convert(
                                utf8.encode(value),
                              )
                              .toString();
                          if (hashValue != password) {
                            return "Wrong password.";
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h),
                    ChangeTextField(
                        title: 'New Password',
                        controller: newPasswordController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required.";
                          }
                          if (value.length <= 6) {
                            return "Password must be of atlest 6 letters.";
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h),
                    ChangeTextField(
                        title: 'Confirm',
                        controller: confirmNewPasswordController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required.";
                          }
                          if (value != newPasswordController.text) {
                            return "Password must match";
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h),
                    ProfileSettings(
                      title: 'Change',
                      buttonPressed: () {
                        if (formKey.currentState!.validate()) {
                          updatePassword(
                            oldUserPassword: oldPasswordController.text,
                            newUserPassword: confirmNewPasswordController.text,
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Error while performing the task.');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
