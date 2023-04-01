import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/loginAndRegistration/login.dart';
import 'package:fyp_project/providers/add_image_provider.dart';
import 'package:fyp_project/providers/admin/user_list_provider.dart';
import 'package:fyp_project/providers/admin/users_details_provider.dart';
import 'package:fyp_project/providers/heritage_favorite_provider.dart';
import 'package:fyp_project/providers/heritage_photo_provider.dart';
import 'package:fyp_project/providers/hiking_favorite_provider.dart';
import 'package:fyp_project/providers/hiking_photo_provider.dart';
import 'package:fyp_project/providers/navigation_provider.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/providers/trekking_photo_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure the screen size is available before running the app.
  await ScreenUtil.ensureScreenSize();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Create a set of providers to be used by the app.
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
        ChangeNotifierProvider(
          create: (BuildContext context) => HeritagePhotoProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HeritagePhotoFavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AddImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UsersDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserListProvider(),
        ),
      ],
      child: ScreenUtilInit(
        // Set the design size of the screen for scaling the UI.
        designSize: const Size(360, 690),
        // Allow the text size to adapt to the screen size.
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // Build the app using the MaterialApp widget.
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        },
      ),
    );
  }
}
