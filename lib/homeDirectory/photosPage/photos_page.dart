import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/add_photos.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/saved_photos.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/shared_photos.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ConstantColors.kDarkGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("My Photos"),
            SizedBox(width: 8.w),
            const Icon(Icons.photo_size_select_actual_outlined)
          ],
        ),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          CustomPhotosWidget(
            title: "       Add Your \n         Photos",
            icon: Icons.add_photo_alternate_outlined,
            onPressed: () {
              // print(
              //     Provider.of<CurrentUser>(context, listen: false).user.userId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPhotos(),
                ),
              );
            },
          ),
          SizedBox(height: 30.h),
          CustomPhotosWidget(
            title: '      Save / Scan \n           Photos',
            icon: Icons.import_export_sharp,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SharedPhotos()));
            },
          ),
        ],
      ),
    );
  }
}

class CustomPhotosWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const CustomPhotosWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 6.h, right: 6.h),
        height: 125.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ConstantColors.kDarkGreen.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 100.h,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: ConstantColors.kNeutralSkin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
