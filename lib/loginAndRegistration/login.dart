import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/loginAndRegistration/register_first.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';
import 'package:fyp_project/navigation_bar.dart';
import 'package:fyp_project/users/user_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isHidden = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const UpperPart(),
            const UpperText(title: "Login"),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                        contentPadding: EdgeInsets.all(15.w),
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        suffix: InkWell(
                          hoverColor: Colors.black,
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    LowerButton(
                      title: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginUserNow();
                        } else {}
                      },
                    ),
                    LowerPart(
                      title: "Haven't registered?",
                      buttonText: 'Sign Up',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterFirst()));
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

  //Function to make password visible
  _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  loginUserNow() async {
    try {
      final res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(
            msg: "Logging in",
            backgroundColor: Colors.green,
            fontSize: 16,
          );
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);
          //save userInfo to local storage using Shared preferences
          await RememberUsersPrefs.saveRememberUser(userInfo);

          Future.delayed(const Duration(milliseconds: 2000), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GoogleNavigationBar()));
          });
        } else {
          Fluttertoast.showToast(
              msg: "Incorrect email or password",
              fontSize: 16,
              backgroundColor: Colors.red);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
