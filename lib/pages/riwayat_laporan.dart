import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1E293B)),
          onPressed: () {
            // Aksi tombol kembali
          },
        ),
        title: const Text(
          "Riwayat Laporan",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Tab Atas (Semua, Diproses, Selesai)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterButton("Semua", true),
                const SizedBox(width: 8),
                _buildFilterButton("Diproses", false),
                const SizedBox(width: 8),
                _buildFilterButton("Selesai", false),
              ],
            ),
          ),
          const SizedBox(height: 8),
          
          // Daftar List Riwayat Laporan
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildReportItem(
                  title: "AC Ruang 302",
                  location: "Gedung FEBI",
                  date: "12 Juni 2026",
                  status: "Diajukan",
                  statusColor: Colors.amber.shade800,
                  statusBg: Colors.amber.shade100,
                ),
                _buildReportItem(
                  title: "Toilet Lt. 1",
                  location: "Gedung Rektorat",
                  date: "11 Juni 2026",
                  status: "Diproses",
                  statusColor: Colors.blue.shade700,
                  statusBg: Colors.blue.shade100,
                ),
                _buildReportItem(
                  title: "Lampu kelas",
                  location: "Gedung FST",
                  date: "9 Juni 2026",
                  status: "Selesai",
                  statusColor: Colors.green.shade700,
                  statusBg: Colors.green.shade100,
                ),
                _buildReportItem(
                  title: "Meja rusak",
                  location: "Gedung FTIK",
                  date: "8 Juni 2026",
                  status: "Selesai",
                  statusColor: Colors.green.shade700,
                  statusBg: Colors.green.shade100,
                ),
                _buildReportItem(
                  title: "WIFI lemah",
                  location: "Gedung Perpustakaan",
                  date: "6 Juni 2026",
                  status: "Diproses",
                  statusColor: Colors.blue.shade700,
                  statusBg: Colors.blue.shade100,
                ),
              ],
            ),
          ),
        ],
      ),
      // Navigasi Bawah (Bottom Navigation Bar)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks 1 aktif di menu "Laporan"
        selectedItemColor: const Color(0xFF1E293B),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Laporan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol filter di atas
  Widget _buildFilterButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2C3E50) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF2C3E50) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Widget untuk setiap baris daftar laporan
  Widget _buildReportItem({
    required String title,
    required String location,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBg,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Kotak gambar thumbnail di sebelah kiri
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          
          // Informasi teks (Judul, Lokasi, Badge Status)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Tanggal di sebelah kanan
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}