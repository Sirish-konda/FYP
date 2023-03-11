import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageProvider extends ChangeNotifier {
  List<XFile> _imageFileList = [];

  List<XFile> get imageFileList => _imageFileList;

  void addImage(XFile image) {
    _imageFileList.add(image);
    notifyListeners();
  }

  void deleteImage(int index) {
    _imageFileList.removeAt(index);
    notifyListeners();
  }
}
