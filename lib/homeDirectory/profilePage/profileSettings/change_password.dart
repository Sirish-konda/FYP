import 'package:flutter/material.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/change_text_field.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';
import '../../../constants/constant_colors.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
                'Change your password',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              ChangeTextField(
                title: 'Old Password',
              ),
              ChangeTextField(
                title: 'New Password',
              ),
              ChangeTextField(
                title: 'Confirm',
              ),
              ProfileSettings(
                title: 'Change',
                buttonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
