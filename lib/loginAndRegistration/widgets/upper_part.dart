import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constant_colors.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: FirstClipper(),
          child: Container(
            decoration: const BoxDecoration(
              color: ConstantColors.kLightGreen,
            ),
            alignment: Alignment.center,
            height: 400.h,
            width: 400.w,
            // color: const Color(0xFF656AEC),
          ),
        ),
        Positioned(
            right: 0, bottom: 0, child: Image.asset('assets/images/logo.png'))
      ],
    );
  }
}

//Curve ko lagi clipper
class FirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width * 1.0021250, size.height * 0.1936833,
        size.width, size.height * 0.3828167);
    path0.quadraticBezierTo(
        size.width * 0.8928875, size.height, 1, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
