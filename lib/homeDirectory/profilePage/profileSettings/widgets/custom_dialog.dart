import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constant_colors.dart';
import '../../../../providers/hiking_favorite_provider.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 35.h, bottom: 20.h, right: 20.h, left: 20.h),
            height: 180.h,
            decoration: BoxDecoration(
                color: ConstantColors.kNeutralSkin,
                borderRadius: BorderRadius.circular(30.r)),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 100.w,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: ConstantColors.kLightGreen),
                        onPressed: () {
                          context.read<TrekkingPhotoFavoriteProvider>().reset();
                          context.read<HikingPhotoFavoriteProvider>().reset();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: ConstantColors.kLightGreen),
                        child: Text(
                          'No',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -60.h,
            child: CircleAvatar(
              backgroundColor: ConstantColors.kLightGreen,
              radius: 50.r,
              child: Icon(
                Icons.logout_sharp,
                size: 50.h,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
