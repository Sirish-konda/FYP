import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/open_share_photo.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/photo_qr.dart';
import 'package:fyp_project/providers/add_image_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../apiConnection/api_connection.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  final ImagePicker imagePicker = ImagePicker();

  void deleteImage(int index) {
    final imageList = Provider.of<AddImageProvider>(context, listen: false);
    imageList.deleteImage(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Future uploadUrl({
    //   required String userId,
    //   required File? image,
    // }) async {
    //   try {
    //     var uri = Uri.parse(API.addImage);
    //     var request = http.MultipartRequest('POST', uri);
    //     request.fields['user_id'] = userId;
    //     var pic = await http.MultipartFile.fromPath("image", image!.path);
    //     request.files.add(pic);

    //     var response = await request.send();

    //     if (response.statusCode == 200) {
    //       //final responseString = await response.stream.bytesToString();
    //       print(response.statusCode);
    //     } else {
    //       print('not working');
    //     }
    //   } catch (e) {
    //     print('this is the error $e');
    //     return e;
    //   }
    // }

    final imageList = Provider.of<AddImageProvider>(context).imageFileList;
//     void selectImages() async {
//       final List<XFile>? selectImages = await imagePicker.pickMultiImage();
//       if (selectImages!.isNotEmpty) {
//         final imageList =
//             Provider.of<AddImageProvider>(context, listen: false).imageFileList;
//         imageList.addAll(selectImages);

//         for (var imageFile in selectImages) {
//           // Read the contents of the image file into a variable
//           final bytes = await imageFile.readAsBytes();
//           final imageData = base64Encode(bytes);

// uploadUrl(userId: Provider.of<CurrentUser>(context).user.userId.toString(), image: selectImages,),
//           // Send an HTTP POST request to the PHP script with the image data

//         }
//       }
//     }

    Future<void> uploadImages(List<XFile> images) async {
      try {
        for (var image in images) {
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(API.addImage),
          );
          request.fields['user_id'] =
              Provider.of<CurrentUser>(context, listen: false)
                  .user
                  .userId
                  .toString();
          request.files
              .add(await http.MultipartFile.fromPath('image', image.path));
          var response = await request.send();

          if (response.statusCode == 200) {
          } else {}
        }
      } catch (e) {
        print(e);
      }
    }

    void selectImages() async {
      final List<XFile>? selectImages = await imagePicker.pickMultiImage();
      if (selectImages!.isNotEmpty) {
        if (imageList.contains(selectImages)) {
          return null;
        } else {
          imageList.addAll(selectImages);
          await uploadImages(selectImages); // Upload the image to the server
        }
      }
      setState(() {});
    }

    showSnackBarDelete(BuildContext context, int index) {
      final addedSnackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ConstantColors.kDarkGreen,
        duration: const Duration(seconds: 2),
        content: Column(
          children: [
            Text(
              'Do you want to delete this image?',
              style: TextStyle(
                  fontSize: 18.sp, color: ConstantColors.kNeutralSkin),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    deleteImage(index);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ConstantColors.kLightGreen,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: const Text('No'),
                ),
              ],
            )
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(addedSnackBar);
    }

    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kDarkGreen,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text("Your photos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectImages();
        },
        backgroundColor: ConstantColors.kDarkGreen,
        child: const Icon(Icons.add),
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
              child: Image.file(
                File(imageList[index].path),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              onLongPress: () {
                showSnackBarDelete(context, index);
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoQr(
                      path: imageList[index].path,
                    ),
                  ),
                );
              },
            );
          },
          itemCount: imageList.length,
        ),
      ),
    );
  }
}
