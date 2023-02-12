import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constant_colors.dart';
import '../../models/hikking_model.dart';
import '../homePage/destination_desc_hiking.dart';

class ShowFavoriteContainerHiking extends StatefulWidget {
  final HikingModel hiking;

  const ShowFavoriteContainerHiking({Key? key, required this.hiking})
      : super(key: key);

  @override
  State<ShowFavoriteContainerHiking> createState() =>
      _ShowFavoriteContainerHikingState();
}

class _ShowFavoriteContainerHikingState
    extends State<ShowFavoriteContainerHiking> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDescHiking(
              hikingModel: widget.hiking,
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
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 200.h,
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.hiking.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hiking.title,
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
                          widget.hiking.intro,
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
    );
  }
}
