import 'package:flutter/material.dart';
import 'buat_laporan_mhs.dart';
import 'detail_laporan.dart'; // Sesuaikan path jika berada di subfolder
import 'home_page.dart';
import 'profil_page.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  String selectedFilter = "Semua";

  (Color, Color) _warnaStatus(String status) {
    switch (status) {
      case "Diproses":
        return (Colors.blue.shade700, Colors.blue.shade100);
      case "Selesai":
        return (Colors.green.shade700, Colors.green.shade100);
       default:
        return (Colors.amber.shade800, Colors.amber.shade100);
    }
  }

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BerandaMahasiswaPage()),
            );
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
          // Filter Tab Atas (Semua, Diajukan, Diproses, Selesai)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterButton("Semua"),
                const SizedBox(width: 8),
                 _buildFilterButton("Diajukan"),
                const SizedBox(width: 8),
                _buildFilterButton("Diproses"),
                const SizedBox(width: 8),
                _buildFilterButton("Selesai"),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Daftar List Riwayat Laporan dari daftarLaporanNotifier
          Expanded(
            child: ValueListenableBuilder<List<LaporanItem>>(
              valueListenable: daftarLaporanNotifier,
              builder: (context, semuaLaporan, _) {
                final filteredList = selectedFilter == "Semua"
                    ? semuaLaporan
                    : semuaLaporan
                        .where((item) => item.status == selectedFilter)
                        .toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada laporan pada status ini.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final (textColor, bgColor) = _warnaStatus(item.status);
                    final bool bisaBukaDetail =
                        index == 0 || item.fasilitas == "AC Ruang 302";

                    return _buildReportItem(
                      title: item.fasilitas,
                      location: item.lokasi,
                      date: item.waktu,
                      status: item.status,
                      statusColor: textColor,
                      statusBg: bgColor,
                      onTap: bisaBukaDetail
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailLaporanPage(
                                    title: item.fasilitas,
                                    location: item.lokasi,
                                    date: item.waktu,
                                    status: item.status,
                                  ),
                                ),
                              );
                            }
                          : () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF567C8D),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) return;

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BerandaMahasiswaPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HalamanProfilMhs()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description),
            label: "Laporan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    final bool isSelected = selectedFilter == text;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildReportItem({
    required String title,
    required String location,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
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
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}