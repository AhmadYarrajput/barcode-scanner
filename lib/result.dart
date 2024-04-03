import 'package:flutter/material.dart';

import 'qr_scanner.dart';

class Result extends StatelessWidget {
  final String code;
  final Function() closescreen;
  const Result({super.key, required this.closescreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              closescreen();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black87,
            )),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // QrImageView(
            //   data: code,
            //   size: 150,
            //   version: QrVersions.auto,
            // ),
            Image.network('https://www.labelsandlabeling.com/sites/labels/lnl/files/Books/figure_1.1_-_barcodes_-_a_pattern_of_black_and_white_lines.png'),
            const Text(
              'Scanned result',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              code,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 1, color: Colors.black87),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
