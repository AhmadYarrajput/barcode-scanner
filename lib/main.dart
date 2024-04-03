import 'package:flutter/material.dart';

import 'qr_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Colors.transparent, elevation: 0.0)),
      debugShowCheckedModeBanner: false,
      home: const QRScanner(),
    );
  }
}
