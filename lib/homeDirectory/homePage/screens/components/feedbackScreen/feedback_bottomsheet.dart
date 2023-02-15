import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants/constant_colors.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: ConstantColors.kLightGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Share your Travel',
              style: TextStyle(
                  color: ConstantColors.kNeutralSkin, fontSize: 30.sp),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                // controller: feedbackController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                minLines: 1,
                autofocus: false,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width.w,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: ConstantColors.kNeutralSkin,
                  backgroundColor: ConstantColors.kDarkGreen.withOpacity(0.5),
                  side: BorderSide(width: 2.w),
                ),
                child: const Text('Post'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
