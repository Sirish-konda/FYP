import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/photosPage/photos_page.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/Qr_scan_page.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/open_share_photo.dart';
import 'package:fyp_project/navigator_extension.dart';

class SharedPhotos extends StatelessWidget {
  const SharedPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text("Shared Photos"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          CustomPhotosWidget(
            title: "Saved Photo's",
            icon: Icons.download_done_sharp,
            onPressed: () {
              context.push(OpenSharePhoto());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => OpenSharePhoto()),
              // );
            },
          ),
          SizedBox(height: 20.h),
          CustomPhotosWidget(
            title: "Scan a Photo",
            icon: Icons.qr_code_scanner_outlined,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrScanPage()));
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
