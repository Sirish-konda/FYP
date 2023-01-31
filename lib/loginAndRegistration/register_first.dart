import 'package:flutter/material.dart';
import 'package:fyp_project/loginAndRegistration/register_second.dart';
import 'login.dart';

class RegisterFirst extends StatefulWidget {
  const RegisterFirst({Key? key}) : super(key: key);

  @override
  State<RegisterFirst> createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
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
                      color: Color(0xFF95D5B2),
                    ),
                    alignment: Alignment.center,
                    height: 400,
                    width: 400,
                    // color: const Color(0xFF656AEC),
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/logo.png'))
              ],
            ),
            const Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
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
                  const SizedBox(height: 25),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterSecond()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 58,
                        width: 328,
                        decoration: BoxDecoration(
                          color: const Color(0xFF95D5B2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already registered?",
                        style: TextStyle(fontSize: 18, color: Colors.black26),
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
                            style: TextStyle(color: Color(0xFF95D5B2)),
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
