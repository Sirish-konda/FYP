import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/profilePage/profileSettings/widgets/profile_settings.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key});

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  double rating = 0;
  double satisfaction = 0;
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> sendFeedback(
      int userId,
      String userName,
      String rating,
      String satisfaction,
      String feedback,
    ) async {
      try {
        var res = await http.post(
          Uri.parse(API.feedback),
          body: jsonEncode(
            {
              'user_id': userId,
              'user_name': userName,
              'rating': rating,
              'satisfaction': satisfaction,
              'feedback': feedback,
            },
          ),
        );
        if (res.statusCode == 200) {
          var resBodyOfFeedback = jsonDecode(res.body);
          if (resBodyOfFeedback['result'] == true) {
            Fluttertoast.showToast(msg: "Working");
          } else {
            Fluttertoast.showToast(msg: "Not Working");
          }
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text("We want to hear from you"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10.h,
                right: 10.h,
                top: 20.h,
                bottom: 20.h,
              ),
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstantColors.kMidGreen,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Question 1',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "How would you rate this app?",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    allowHalfRating: true,
                    minRating: 1,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                    updateOnDrag: true,
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                  ),
                  Text(
                    '(Rating: $rating)',
                    style: TextStyle(
                        fontSize: 12.sp, color: ConstantColors.kNeutralSkin),
                  ),
                ],
              ),
            ),
            Container(
              height: 150.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 20.h),
              decoration: BoxDecoration(
                color: ConstantColors.kMidGreen,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Question 2',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "How satisfied are you with our app?",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    initialRating: satisfaction,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return const Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return const Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return const Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return const Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                        default:
                          return Container();
                      }
                    },
                    onRatingUpdate: (rating) {
                      setState(
                        () {
                          satisfaction = rating;
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Not Satisfied",
                        style: TextStyle(
                            color: ConstantColors.kNeutralSkin,
                            fontSize: 12.sp),
                      ),
                      Text(
                        "Very Satisfied",
                        style: TextStyle(
                            color: ConstantColors.kNeutralSkin,
                            fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              margin: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ConstantColors.kMidGreen,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Question 2',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "What do you think about this app?",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: feedbackController,
                    minLines: 2,
                    maxLines: 5,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "We would like to hear from you",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProfileSettings(
              title: 'Submit',
              buttonPressed: () {
                sendFeedback(
                    Provider.of<CurrentUser>(context, listen: false)
                        .user
                        .userId,
                    Provider.of<CurrentUser>(context, listen: false)
                        .user
                        .userName,
                    rating.toString(),
                    satisfaction.toString(),
                    feedbackController.text);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
