import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_project/constants/constant_colors.dart';
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

  late String scannedData;

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
      backgroundColor: ConstantColors.kLightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('scan this code '),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: buildQrView(context),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print(scannedData);
            },
            child: Container(
              height: 50,
              width: 120,
              child: Text(
                'save image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
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
