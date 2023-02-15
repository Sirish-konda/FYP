import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constant_colors.dart';
import '../../../models/trekking_model.dart';
import '../../homePage/trekkingHome/destination_desc_trekking.dart';

class ShowFavoriteContainerTrekking extends StatefulWidget {
  final TrekkingModel trekking;
  const ShowFavoriteContainerTrekking({Key? key, required this.trekking})
      : super(key: key);

  @override
  State<ShowFavoriteContainerTrekking> createState() =>
      _ShowFavoriteContainerTrekkingState();
}

class _ShowFavoriteContainerTrekkingState
    extends State<ShowFavoriteContainerTrekking> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDescTrekking(
              trekkingModel: widget.trekking,
            ),
          ),
        );
      },
      child: Container(
        height: 400.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: ConstantColors.kNeutralSkin,
          border: Border.all(color: ConstantColors.kDarkGreen, width: 4),
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
                  height: 180.h,
                  width: 300.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.trekking.imagePath,
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
                          widget.trekking.title,
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
                          widget.trekking.intro,
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
