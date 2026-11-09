import 'package:flutter/material.dart';
import 'package:proyek_kampuscare/pages/home_page.dart';
import 'pages/buat_laporan_mhs.dart';

void main() {
  runApp(KampusCare());
}

class KampusCare extends StatelessWidget {
  const KampusCare({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuatLaporanPage(),
    );
  }
}


