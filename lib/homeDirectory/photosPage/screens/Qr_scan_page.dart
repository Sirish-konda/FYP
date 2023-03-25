import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp_project/constants/constant_colors.dart';
import 'package:fyp_project/loginAndRegistration/widgets/lower_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  Barcode? barcode;

  late String  scannedData;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  void reassemble() async {
    // TODO: implement reassemble
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
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            'Scan this code.',
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.h),
          Text(
            'So that the photo will be saved in the saved photos page.',
            style:
                TextStyle(fontSize: 16.sp, color: ConstantColors.kNeutralSkin),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 350,
            width: 350,
            color: Colors.white,
            child: buildQrView(context),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextButton(
            onPressed: () {
              print(scannedData);
            },
            child: Container(
              alignment: Alignment.center,
              height: 45.h,
              width: 328.w,
              decoration: BoxDecoration(
                color: ConstantColors.kDarkGreen,
                borderRadius: BorderRadius.circular(20.r),
              ),
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

    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
        scannedData = barcode.code!;
      });
    });
  }
}
