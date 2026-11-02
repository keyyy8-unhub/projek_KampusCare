import 'package:flutter/material.dart';

class BerandaMahasiswaPage extends StatelessWidget {
  const BerandaMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const Color navyColor = Color(0xFF2F4156);
    const Color tealColor = Color(0xFF567C8D);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Header Selamat datang dan Profil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text(
                        'Halo,',
                        style: TextStyle(
                          fontSize: 16,
                          color: navyColor,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Barokatus Staniyah',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: navyColor,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'NIM 43050250000',
                        style: TextStyle(
                          fontSize: 13,
                          color: tealColor,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: tealColor,
                    child: Icon(Icons.person, color: Colors.white size: 30),
                  )
                ],
              ),
              const SizedBox(height: 20),

              //card Tombol buat laporan //SAMPE INI YA
            ],
          ),
        )
      ),
    )
  }
}