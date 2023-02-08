import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constant_colors.dart';
import '../../../models/trekking_model.dart';
import '../../homePage/screens/destinationDesc/widgets/destination_desc.dart';

class ShowFavoriteContainer extends StatefulWidget {
  final TrekkingModel trekking;
  const ShowFavoriteContainer({Key? key, required this.trekking})
      : super(key: key);

  @override
  State<ShowFavoriteContainer> createState() => _ShowFavoriteContainerState();
}

class _ShowFavoriteContainerState extends State<ShowFavoriteContainer> {
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
                      widget.trekking.imagePath,
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
            widget.trekking.title,
            style:
                TextStyle(color: ConstantColors.kNeutralSkin, fontSize: 20.sp),
          ),
          Text(widget.trekking.id.toString()),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DestinationDesc(trekkingModel: widget.trekking),
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
