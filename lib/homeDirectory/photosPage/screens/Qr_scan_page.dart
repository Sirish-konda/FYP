import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_project/apiConnection/api_connection.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/users/current_user.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  List<String> imageList = [];

  bool codeRead = false;

  QRViewController? controller;

  Barcode? barcode;

  late String scannedData;
  late String imageName;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void initState() {
    checkImages();
    super.initState();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.kDarkGreen,
        title: const Text("Scan Qr"),
      ),
      backgroundColor: ConstantColors.kLightGreen,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'Scan this code.',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            Text(
              'So that the photo will be saved in the saved photos page.',
              style: TextStyle(
                  fontSize: 16.sp, color: ConstantColors.kNeutralSkin),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            Stack(
              children: [
                Container(
                  height: 300.h,
                  width: 300.w,
                  color: Colors.white,
                  child: buildQrView(context),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 70.h,
                  child: Container(
                    alignment: Alignment.center,
                    width: 150.w,
                    padding: EdgeInsets.all(13.sp),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      barcode != null ? 'QR found' : 'Scan Code',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Visibility(
              visible: codeRead,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ConstantColors.kDarkGreen,
                ),
                onPressed: () {
                  setImage(setImageName: imageName);
                },
                child: Text(
                  'Save Image',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderWidth: 10,
        borderLength: 20,
        borderColor: Colors.white,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen(
      (barcode) {
        setState(
          () {
            this.barcode = barcode;
            scannedData = barcode.code!;
            String imageUrl = scannedData;
            imageName = imageUrl.substring(imageUrl.lastIndexOf('/') + 1);
            if (imageList.contains(barcode.code)) {
              codeRead = true;
            } else {
              codeRead = false;
            }
          },
        );
      },
    );
  }

  Future<void> checkImages() async {
    try {
      var response = await http.get(
        Uri.parse(API.getAllImage),
      );

      if (response.statusCode == 200) {
        var responseDecode = jsonDecode(response.body);

        if (responseDecode['success']) {
          List<dynamic> allPhotos = responseDecode['AllPhotos'];
          for (var photos in allPhotos) {
            //  ${API.hostConnect}/profilePicture/${Provider.of<CurrentUser>(context).user.userProfile!}"
            imageList.add('${API.hostConnect}/userimages/$photos');
          }
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  Future<void> setImage({required String setImageName}) async {
    try {
      var response = await http.post(
        Uri.parse(API.setSharedImage),
        body: jsonEncode(
          {
            'user_id':
                Provider.of<CurrentUser>(context, listen: false).user.userId,
            'photo_name': setImageName
          },
        ),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          Fluttertoast.showToast(msg: "Image saved");
        } else {
          Fluttertoast.showToast(msg: "You already have this image");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
