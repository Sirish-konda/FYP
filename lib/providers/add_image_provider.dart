import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../apiConnection/api_connection.dart';

class AddImageProvider extends ChangeNotifier {
  final List<XFile> _imageFileList = [];

  List<XFile> get imageFileList => _imageFileList;

  void addImage(XFile image) {
    _imageFileList.add(image);
    notifyListeners();
  }

  void reset() {
    _imageFileList.clear();
    notifyListeners();
  }

  void getImage(
    int userId,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(API.getImage),
        body: jsonEncode(
          {
            'user_id': userId,
          },
        ),
      );
//"${API.hostConnect}/profilePicture/${Provider.of<CurrentUser>(context).user.userProfile!}",
      if (res.statusCode == 200) {
        var resFavoriteBody = jsonDecode(res.body);

        if (resFavoriteBody['success'] == true) {
          List<dynamic> userPhotos = resFavoriteBody['userPhotos'];
          // print(userPhotos);
          for (var favorite in userPhotos) {
            String pathName = "${API.hostConnect}/userimages/${favorite[0]}";
            XFile imagePath = XFile(pathName);
            imageFileList.add(imagePath);
          }
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "ERROR WHILE GETTING IMAGE WHILE LOADING FROM NEW SCREEN");
    }
  }

  uploadImages(List<XFile> images, String userId) async {
    try {
      for (var image in images) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(API.addImage),
        );
        request.fields['user_id'] = userId;
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));
        var response = await request.send();

        if (response.statusCode == 200) {
          String responseString = await response.stream.bytesToString();
          Map<String, dynamic> responseData = jsonDecode(responseString);
          String pathName =
              "${API.hostConnect}/userimages/${responseData['name']}";

          imageFileList.add(XFile(pathName));
          notifyListeners();
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'ERROR WHILE UPLOADING IMAGE');
    }
  }

  deleteImage(String imageName, int userId, int index) async {
    try {
      var url = Uri.parse(API.deleteImage);
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            "user_id": userId,
            "photo_name": imageName,
          },
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['success']) {
          imageFileList.removeAt(index);

          notifyListeners();
          // Image deleted successfully
        } else {
          // Image delete failed
        }
      } else {
        // Error occurred while deleting image
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "ERROR WHILE DELETEING IMAGE");
      // Handle error
    }
  }
}
