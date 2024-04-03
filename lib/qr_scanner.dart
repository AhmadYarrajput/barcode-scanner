// ignore_for_file: avoid_print

import 'package:barcode_scanner/barcode_reader.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'QR Scanner',
          style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
                child: Column(
              children: [
                Text(
                  'Place the QR code in the area',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Scanning will be started automatically',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            )),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: const LinearGradient(colors: [
            //         Colors.blue,
            //         Colors.red,
            //       ], stops: [
            //         0.1,
            //         1
            //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Column(
            //     children: [
            //       Center(
            //           child: _image == null
            //               ? const Text('No image selected')
            //               : Image.file(
            //                   _image!,
            //                   height: 200,
            //                 )),
            //       // TextButton(
            //       //     onPressed: () {
            //       //       getImage();
            //       //     },
            //       //     child: const Text(
            //       //       'Choose From Gallery',
            //       //       style: TextStyle(
            //       //           fontSize: 18,
            //       //           color: Colors.white,
            //       //           letterSpacing: 1),
            //       //     )),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blue,
                    Colors.red,
                  ], stops: [
                    0.1,
                    1
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BarcodeReader()),
                    );
                  },
                  child: const Text(
                    'OPEN SCANNER',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white, letterSpacing: 1),
                  )),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Scan your code easily',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
