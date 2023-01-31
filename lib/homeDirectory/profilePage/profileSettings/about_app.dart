import 'package:flutter/material.dart';
import 'package:fyp_project/constants/constant_colors.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'About the app',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Center(
        child: Text('About this app'),
      ),
    );
  }
}
