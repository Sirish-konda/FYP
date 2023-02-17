import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../../../../apiConnection/api_connection.dart';
import '../../../../constants/constant_colors.dart';
import '../../../../users/current_user.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
                color: ConstantColors.kDarkGreen.withOpacity(0.3)),
            padding: EdgeInsets.all(20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(
                          fontSize: 25.sp, color: ConstantColors.kNeutralSkin),
                    ),
                    Text(
                      Provider.of<CurrentUser>(context)
                          .user
                          .userName
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ConstantColors.kNeutralSkin),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: GestureDetector(
                      child:
                          Provider.of<CurrentUser>(context).user.userProfile !=
                                  ""
                              ? Image.network(
                                  "${API.hostConnect}/profilePicture/${Provider.of<CurrentUser>(context).user.userProfile!}",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
