import 'package:flutter/material.dart';
import 'package:fyp_project/constants/constant_colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 200,
        color: ConstantColors.kLightGreen,
      ),
    );
  }
}
