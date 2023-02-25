import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/loginAndRegistration/login.dart';
import 'package:fyp_project/providers/hiking_favorite_provider.dart';
import 'package:fyp_project/providers/hiking_photo_provider.dart';
import 'package:fyp_project/providers/navigation_provider.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/providers/trekking_photo_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TrekkingPhotoProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HikingPhotoProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => TrekkingPhotoFavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HikingPhotoFavoriteProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        },
      ),
    );
  }
}
