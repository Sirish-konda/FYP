import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/loginAndRegistration/login.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({Key? key}) : super(key: key);

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  bool _isHidden = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const UpperPart(),
            const UpperText(title: 'Register'),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
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
                      controller: _passwordController,
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
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required.';
                        }
                        if (value != _passwordController.toString()) {
                          return 'Password must be the same as above';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                    LowerButton(title: 'Register', onPressed: () {}),
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

//Function to make password visible
  _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
