import 'package:flutter/material.dart';
import 'login_mhs_page.dart'; 

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Tunggu 3 detik, lalu pindah ke halaman login mahasiswa
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginMhsScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F4156), // Satu warna latar belakang navy
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo rumah + gerigi berwarna putih
              const Icon(
                Icons.home_work_rounded,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 16),

              // Nama aplikasi
              const Text(
                'KampusCare',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'serif',
                ),
              ),
              const SizedBox(height: 8),

              // Tulisan dibawah KampusCare
              const Text(
                'Laporkan, Pantau, Perbaiki',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}