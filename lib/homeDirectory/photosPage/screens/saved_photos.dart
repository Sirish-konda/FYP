import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SavedPhotos extends StatefulWidget {
  const SavedPhotos({super.key});

  @override
  State<SavedPhotos> createState() => _SavedPhotosState();
}

class _SavedPhotosState extends State<SavedPhotos> {
  List<String> imageList = [];

  @override
  void initState() {
    getSharedImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text('Your Photo'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 7.h, right: 7.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 2,
              crossAxisSpacing: 7.h,
              mainAxisSpacing: 7.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Image.network(
                imageList[index],
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              onLongPress: () {
                //showSnackBarDelete(context, index, imageList[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: ConstantColors.kDarkGreen,
                    duration: const Duration(seconds: 2),
                    content: Column(
                      children: [
                        Text(
                          'Do you want to delete this image?',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: ConstantColors.kNeutralSkin),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: ConstantColors.kLightGreen,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              child: const Text('No'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              onTap: () {},
            );
          },
          itemCount: imageList.length,
        ),
      ),
    );
  }

  Future<void> getSharedImages() async {
    try {
      var response = await http.post(
        Uri.parse(API.getSharedImage),
        body: jsonEncode(
          {
            'user_id':
                Provider.of<CurrentUser>(context, listen: false).user.userId,
          },
        ),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          List<dynamic> allPhotos = responseBody['AllPhotos'];
          for (var photos in allPhotos) {
            //  ${API.hostConnect}/profilePicture/${Provider.of<CurrentUser>(context).user.userProfile!}"
            setState(() {
              imageList.add('${API.hostConnect}/userimages/$photos');
            });
          }
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
