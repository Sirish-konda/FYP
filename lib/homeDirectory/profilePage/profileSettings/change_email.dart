import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/change_text_field.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../apiConnection/api_connection.dart';
import '../../../constants/constant_colors.dart';

class ChangeEmail extends StatelessWidget {
  ChangeEmail({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  final oldEmailController = TextEditingController();

  final newEmailController = TextEditingController();

  final confirmNewEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> updateEmail(
        {required String oldEmail, required String newEmail}) async {
      try {
        var response = await http.post(
          Uri.parse(API.updateEmail),
          body: {
            'old_email': oldEmail,
            'new_email': newEmail,
          },
        );

        if (response.statusCode == 200) {
          var resBodyOfSignUp = jsonDecode(response.body);
          if (resBodyOfSignUp['success'] == true) {
            Fluttertoast.showToast(
                msg: 'Your email has been succesfully changed.',
                backgroundColor: Colors.green,
                fontSize: 16);
            Provider.of<CurrentUser>(context, listen: false)
                .updateUserEmail(newEmail);
            Navigator.pop(context);
          } else {
            Fluttertoast.showToast(
                msg: 'Error occured try again',
                backgroundColor: Colors.red,
                fontSize: 16);
          }
        }
      } catch (e) {
        print(e);
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
                'Change your email',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Form(
                key: formKey1,
                child: Column(
                  children: [
                    ChangeTextField(
                      title: 'Old e-mail address',
                      controller: oldEmailController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        String email =
                            Provider.of<CurrentUser>(context, listen: false)
                                .user
                                .userEmail;
                        if (value != email) {
                          return "Wrong Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    ChangeTextField(
                      title: 'New e-mail address',
                      controller: newEmailController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        String pattern = r'\w+@\w+\.\w+';
                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Invalid E-mail Address format.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    ChangeTextField(
                      title: 'Confirm',
                      controller: confirmNewEmailController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        if (value != newEmailController.text) {
                          return "Email must match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    ProfileSettings(
                      title: 'Change',
                      buttonPressed: () {
                        if (formKey1.currentState!.validate()) {
                          updateEmail(
                            oldEmail: oldEmailController.text,
                            newEmail: newEmailController.text,
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please fill the form properly.",
                              fontSize: 16,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
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
