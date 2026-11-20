import 'package:flutter/material.dart';
import 'pages/logo_page.dart';

void main() {
  runApp(KampusCare());
}

class KampusCare extends StatelessWidget {
  const KampusCare({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}


