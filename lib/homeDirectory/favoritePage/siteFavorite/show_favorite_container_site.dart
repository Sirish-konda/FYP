import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/homeDirectory/homePage/heritageHome/destination_desc_heritage.dart';
import 'package:fyp_project/models/heritage_model.dart';

import '../../../constants/constant_colors.dart';

class ShowFavoriteContainerHeritage extends StatelessWidget {
  final HeritageModel heritage;
  const ShowFavoriteContainerHeritage({super.key, required this.heritage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDescHeritage(
              heritageModel: heritage,
            ),
          ),
        );
      },
      child: Container(
        height: 400.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: ConstantColors.kNeutralSkin,
          border: Border.all(color: ConstantColors.kDarkGreen, width: 5),
          borderRadius: BorderRadius.circular(20.r),
          // border: Border.all(color: Colors.black, width: 4),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 180.h,
                    width: 300.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        heritage.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 180.h,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            heritage.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline),
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                          Text(
                            heritage.intro,
                            style: TextStyle(
                              color: ConstantColors.kDarkGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 9,
                          ),
                          const Spacer(
                            flex: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
