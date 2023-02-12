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
    return Container(
      margin: EdgeInsets.all(20.h),
      height: 255.h,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: ConstantColors.kDarkGreen.withOpacity(0.5),
              blurRadius: 20.r,
              offset: Offset(0, 20.r),
            ),
          ],
          color: ConstantColors.kMidGreen.withOpacity(0.5)),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
                  height: 150.h,
                  width: MediaQuery.of(context).size.width.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      widget.hiking.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 225.h,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30.r,
                ),
              ),
            ],
          ),
          Text(
            widget.hiking.title,
            style:
                TextStyle(color: ConstantColors.kNeutralSkin, fontSize: 20.sp),
          ),
          Text(widget.hiking.id.toString()),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DestinationDescHiking(hikingModel: widget.hiking),
                  ),
                );
              },
              child: const Text(
                "View More",
                style: TextStyle(
                    color: ConstantColors.kDarkGreen,
                    decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
