import 'package:barcode_scanner/result.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
class BarcodeReader extends StatefulWidget {
  const BarcodeReader({super.key});

  @override
  State<BarcodeReader> createState() => _BarcodeReaderState();
}

class _BarcodeReaderState extends State<BarcodeReader> {
  bool isScanCompleted = false;
    void closeScreen() {
      isScanCompleted = false;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MobileScanner(
          fit: BoxFit.cover,
                      allowDuplicates: true,
                      onDetect: (barcode, args) {
                        if (!isScanCompleted) {
                          String code = barcode.rawValue ?? '---';
                          isScanCompleted = true;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                    closescreen: closeScreen, code: code),
                              ));
                        }
                      },
                    ),
      ),
    );
  }
}