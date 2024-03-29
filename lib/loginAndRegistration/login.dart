import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/loginAndRegistration/register_first.dart';
import 'package:fyp_project/loginAndRegistration/admin_login.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';
import 'package:fyp_project/navigation_bar.dart';
import 'package:fyp_project/providers/navigation_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
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
                      onPressed: () async {
                        if (_isLoading) return;
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (formKey.currentState!.validate()) {
                          setState(
                            () {
                              _isLoading = true;
                            },
                          );
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .selectedIndex = 0;
                          await loginUserNow();
                          setState(
                            () {
                              _isLoading = false;
                            },
                          );
                        } else {
                          null;
                        }
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
                    ),
                    const Text('or'),
                    LowerPart(
                      title: "If you are an admin!",
                      buttonText: 'Click Me',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminLogin(),
                          ),
                        );
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

  Future<void> loginUserNow() async {
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

          context.read<CurrentUser>().setUser(userInfo);

          //save userInfo to local storage using Shared preferences
          // await RememberUsersPrefs.storeUserInfo(userInfo);

          Future.delayed(
            const Duration(milliseconds: 2000),
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GoogleNavigationBar()));
            },
          );
        } else {
          Fluttertoast.showToast(
              msg: "Incorrect email or password",
              fontSize: 16,
              backgroundColor: Colors.red);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "There seems to be a problem with the internet.",
          fontSize: 16,
          backgroundColor: Colors.red);
    }
  }
}
