import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/homeDirectory/photosPage/screens/open_photo_for_qr.dart';
import 'package:fyp_project/providers/add_image_provider.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final imageList = Provider.of<AddImageProvider>(context).imageFileList;
    void selectImages() async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final List<XFile>? selectImages = await imagePicker.pickMultiImage();
      if (selectImages!.isNotEmpty) {
        if (imageList.contains(selectImages)) {
          return null;
        } else {
          await Provider.of<AddImageProvider>(context, listen: false)
              .uploadImages(
                  selectImages,
                  Provider.of<CurrentUser>(context, listen: false)
                      .user
                      .userId
                      .toString());
        }
      }
    }

//adding snackbar so that the user gets the option to delete or put the image.
    showSnackBarDelete(BuildContext context, int index, String name) {
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
                    Provider.of<AddImageProvider>(context, listen: false)
                        .deleteImage(
                      name,
                      Provider.of<CurrentUser>(context, listen: false)
                          .user
                          .userId,
                      index,
                    );
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
              child: Image.network(
                imageList[index].path,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              onLongPress: () {
                showSnackBarDelete(
                  context,
                  index,
                  imageList[index].name,
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenPhotoForQr(
                      network: imageList[index].path,
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
