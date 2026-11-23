import 'package:flutter/material.dart';
import 'riwayat_laporan.dart';
import 'profil_page.dart';
import 'buat_laporan_mhs.dart';


class BerandaMahasiswaPage extends StatelessWidget {
  const BerandaMahasiswaPage({super.key});

  static const Color navyColor = Color(0xFF2F4156);
  static const Color tealColor = Color(0xFF567C8D);

  void _onNavTapped(BuildContext context, int index) {
  if (index == 0) return;

  if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RiwayatLaporanPage()),
    );
  } else if (index == 2) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HalamanProfilMhs()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Selamat datang dan Profil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Card Tombol buat laporan
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuatLaporanPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: tealColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.home_repair_service_rounded,
                          color: navyColor,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Buat Laporan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Laporan kerusakan fasilitas kampus',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Status Laporan
              Row(
                children: [
                  Expanded(
                    child: _buildStatusCard(
                      number: '3',
                      label: 'Dalam Proses',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildStatusCard(
                      number: '5',
                      label: 'Selesai',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Header Laporan terbaru
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Laporan Terbaru',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: navyColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // List untuk laporan terbaru
              _buildReportItem(
                title: 'AC Ruang 302',
                subTitle: 'Gedung FEBI',
                time: '3 jam lalu',
                status: 'Diajukan',
                statusBgColor: const Color(0xFFFFF59D),
                statusTextColor: Colors.black87,
              ),
              _buildReportItem(
                title: 'Toilet Lt1 ',
                subTitle: 'Gedung Rektorat',
                time: '10 jam lalu',
                status: 'Diproses',
                statusBgColor: const Color(0xFFBBDEFB),
                statusTextColor: const Color(0xFF1976D2),
              ),
              _buildReportItem(
                title: 'Lampu Kelas',
                subTitle: 'Gedung FST',
                time: '2 hari lalu',
                status: 'Selesai',
                statusBgColor: const Color(0xFFC8E6C9),
                statusTextColor: const Color(0xFF388E3C),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // 0 = Home, 1 = Laporan, 2 = Profil
        onTap: (index) => _onNavTapped(context, index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: tealColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // Widget Box status
  static Widget _buildStatusCard({required String number, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF567C8D),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF567C8D),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buat list Item Laporan
  static Widget _buildReportItem({
    required String title,
    required String subTitle,
    required String time,
    required String status,
    required Color statusBgColor,
    required Color statusTextColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF2F4156),
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: statusTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}