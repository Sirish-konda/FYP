import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/favoritePage/favorite_page.dart';
import 'package:fyp_project/homeDirectory/homePage/home_page.dart';
import 'package:fyp_project/homeDirectory/photosPage/photos_page.dart';
import 'package:fyp_project/homeDirectory/profilePage/profile_page.dart';
import 'package:fyp_project/providers/add_image_provider.dart';
import 'package:fyp_project/providers/heritage_favorite_provider.dart';
import 'package:fyp_project/providers/hiking_favorite_provider.dart';
import 'package:fyp_project/providers/navigation_provider.dart';
import 'package:fyp_project/providers/trekking_favorite_provider.dart';
import 'package:fyp_project/users/current_user.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class GoogleNavigationBar extends StatefulWidget {
  const GoogleNavigationBar({Key? key}) : super(key: key);

  @override
  State<GoogleNavigationBar> createState() => _GoogleNavigationBarState();
}

class _GoogleNavigationBarState extends State<GoogleNavigationBar> {
  // int _selectedIndex = 0;
  static final List<Widget> _navScreen = <Widget>[
    const HomePage(),
    const FavoritePage(),
    const PhotosPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    final userId = context.read<CurrentUser>().user.userId;
    context.read<TrekkingPhotoFavoriteProvider>().getFavoriteTrek(userId);
    context.read<HikingPhotoFavoriteProvider>().getFavoriteHike(userId);
    context.read<HeritagePhotoFavoriteProvider>().getFavoriteSite(userId);
    context.read<AddImageProvider>().getImage(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<NavigationProvider>(context).selectedIndex;
    return Scaffold(
      body: Center(
        child: _navScreen.elementAt(index),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: index,
        onTabChange: (index) {
          context.read<NavigationProvider>().selectedIndex = index;
        },
        tabBorderRadius: 20.r,
        backgroundColor: ConstantColors.kLightGreen,
        color: Colors.black,
        activeColor: Colors.white,
        tabBackgroundColor: ConstantColors.kDarkGreen,
        padding: EdgeInsets.all(13.w),
        tabMargin: EdgeInsets.all(7.w),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.favorite_border,
            text: "Favorite",
          ),
          GButton(
            icon: Icons.photo_size_select_actual_outlined,
            text: "Gallery",
          ),
          GButton(
            icon: Icons.person_2_outlined,
            text: "Profile",
          )
        ],
      ),
    );
  }
}
