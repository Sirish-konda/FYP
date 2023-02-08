import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/loginAndRegistration/register_first.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_part.dart';
import 'package:fyp_project/loginAndRegistration/widgets/upper_text.dart';
import 'package:fyp_project/navigation_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const UpperPart(),
            const UpperText(title: "Login"),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
              child: Column(
                children: [
                  TextFormField(
                    // controller: email,
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
                    // controller: email,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleNavigationBar()));
                    },
                  ),
                  LowerPart(
                    title: "Haven't registered?",
                    buttonText: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterFirst()));
                    },
                  )
                ],
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
