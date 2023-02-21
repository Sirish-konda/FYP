import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("My Photos"),
                SizedBox(width: 8.w),
                const Icon(Icons.photo_size_select_actual_outlined)
              ],
            ),
            backgroundColor: ConstantColors.kDarkGreen,
          )
        ],
      ),
    );
  }
}
