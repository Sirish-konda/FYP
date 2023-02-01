import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/loginAndRegistration/login.dart';

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({Key? key}) : super(key: key);

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                  clipper: FirstClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ConstantColors.kLightGreen,
                    ),
                    alignment: Alignment.center,
                    height: 400.h,
                    width: 400.w,
                    // color: const Color(0xFF656AEC),
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/logo.png'))
              ],
            ),
            Text(
              'Register',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.h),
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
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      // suffix: InkWell(
                      //   onTap: _togglePasswordView,
                      //   child: Icon(
                      //       _isHidden ? Icons.visibility : Icons.visibility_off),
                      // ),
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(),
                      // suffix: InkWell(
                      //   onTap: _togglePasswordView,
                      //   child: Icon(
                      //       _isHidden ? Icons.visibility : Icons.visibility_off),
                      // ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                      onPressed: () {},
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
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already registered?",
                        style:
                            TextStyle(fontSize: 18.sp, color: Colors.black26),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: ConstantColors.kLightGreen),
                          ))
                    ],
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

//Curve ko lagi clipper
class FirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width * 1.0021250, size.height * 0.1936833,
        size.width, size.height * 0.3828167);
    path0.quadraticBezierTo(
        size.width * 0.8928875, size.height, 1, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
