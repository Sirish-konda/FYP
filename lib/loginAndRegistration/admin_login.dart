import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/admin/admin_home.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';
import 'package:http/http.dart' as http;

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _isHidden = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  loginAdminNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.adminLogin),
        body: {
          "admin_email": _emailController.text.trim(),
          "admin_password": _passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin["success"] == true) {
          Fluttertoast.showToast(msg: "You are logging in");
          Future.delayed(
            const Duration(milliseconds: 2000),
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminHome(),
                ),
              );
            },
          );
        } else {
          Fluttertoast.showToast(msg: "Incorrect credentials.");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "There seems to be a problem with the internet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const UpperPart(),
            const UpperText(title: 'Admin'),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required.';
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
                            loginAdminNow();
                          } else {}
                        }),
                    LowerPart(
                        title: "If you are a user!",
                        buttonText: "Sign in",
                        onPressed: () {
                          Navigator.pop(context);
                        })
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
}
