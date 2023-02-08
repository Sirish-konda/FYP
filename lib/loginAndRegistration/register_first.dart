import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/loginAndRegistration/register_second.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';
import '../constants/constant_colors.dart';
import '../models/user.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class RegisterFirst extends StatefulWidget {
  const RegisterFirst({Key? key}) : super(key: key);

  @override
  State<RegisterFirst> createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  bool _isHidden = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 350.h,
              child: const UpperPart(),
            ),
            const UpperText(title: 'Register'),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) =>
                          value == "" ? "Please write name" : null,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide an E-mail';
                        }
                        String pattern = r'\w+@\w+\.\w+';
                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Invalid E-mail Address format.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required.';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(15.w),
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(_isHidden
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          registerAndSaveUserRecord();
                        } else {
                          print('as');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45.h,
                        width: 328.w,
                        decoration: BoxDecoration(
                          color: ConstantColors.kLightGreen,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21.sp),
                        ),
                      ),
                    ),
                    LowerPart(
                      title: "Already registered?",
                      buttonText: 'Sign In',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfValidatingEmail = jsonDecode(res.body);
        if (resBodyOfValidatingEmail['emailFound'] == true) {
          Fluttertoast.showToast(msg: "Email already exists.");
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text,
    );

    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success']) {
          Fluttertoast.showToast(msg: 'Signed up');
        } else {
          Fluttertoast.showToast(msg: 'Error');
        }
      } else {
        print('erroe');
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
