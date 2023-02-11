import 'package:flutter/material.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/favoritePage/widgets/when_not_empty.dart';
import 'package:provider/provider.dart';

class FavoriteHikeScreen extends StatefulWidget {
  const FavoriteHikeScreen({super.key});

  @override
  State<FavoriteHikeScreen> createState() => _FavoriteHikeScreenState();
}

class _FavoriteHikeScreenState extends State<FavoriteHikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: Center(child: Text('hel')),
    );
  }
}
