import 'package:flutter/material.dart';

class HalamanProfilMhs extends StatelessWidget {
  const HalamanProfilMhs ({super.key});


  @override
  Widget build(BuildContext context) {
    const Color navyColor = Color(0xFF2F4156);
    const Color tealColor = Color(0xFF567C8D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: navyColor),
          onPressed: () {},
        ),
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            color: navyColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const CircleAvatar(
                radius: 46,
                backgroundColor: tealColor,
                child: Icon(Icons.person, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 16),

              const Text(
                'Barokatus Staniyah',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: navyColor,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'NIM 43050250000',
                style: TextStyle(
                  fontSize: 14,
                  color: tealColor,
                ),
              ),
              const SizedBox(height: 30),

              _buildInfoItem(
                icon : Icons.school_outlined,
                label : 'Program Studi',
                value : 'Teknologi Informasi',
              ),
              const SizedBox(height: 16),

              _buildInfoItem(
                icon : Icons.account_balance_outlined,
                label : 'Fakultas',
                value : 'Sains dan Teknologi',
              ),
              const SizedBox(height: 16),

              _buildInfoItem(
                icon : Icons.email_outlined,
                label :'Email',
                value : 'barokatusstaniah@gmail.com',
              ),
              const SizedBox(height: 36),

              //edit profil
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_outline, color: navyColor),
                label: const Text(
                  'Edit Profil',
                  style: TextStyle(
                    color: navyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: navyColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //Tombol Logout
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: Colors.redAccent, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //widget pembantu di bagian baris info profil
  static Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF567C8D), size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F4156),
              ),
            )
          ],
        )
      ],
    );
  }
}