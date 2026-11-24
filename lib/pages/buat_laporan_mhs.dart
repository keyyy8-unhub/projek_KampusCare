import 'package:flutter/material.dart';
import 'riwayat_laporan.dart';

// Penyimpanan Data
class LaporanItem {
  final String fasilitas;
  final String lokasi;
  final String kategori;
  final String deskripsi;
  final String waktu;
  final String status;

  const LaporanItem({
    required this.fasilitas,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.waktu,
    required this.status,
  });
}

final ValueNotifier<List<LaporanItem>> daftarLaporanNotifier =
    ValueNotifier<List<LaporanItem>>([
  const LaporanItem(
    fasilitas: 'AC Ruang 302',
    lokasi: 'Gedung FEBI',
    kategori: 'Sedang',
    deskripsi: 'AC tidak dingin',
    waktu: '12 Juni 2026',
    status: 'Diajukan',
  ),
  const LaporanItem(
    fasilitas: 'Toilet Lt. 1',
    lokasi: 'Gedung Rektorat',
    kategori: 'Ringan',
    deskripsi: 'Kran air menetes',
    waktu: '11 Juni 2026',
    status: 'Diproses',
  ),
  const LaporanItem(
    fasilitas: 'Lampu kelas',
    lokasi: 'Gedung FST',
    kategori: 'Berat / Rusak Total',
    deskripsi: 'Dua lampu mati',
    waktu: '9 Juni 2026',
    status: 'Selesai',
  ),
]);

class BuatLaporanPage extends StatefulWidget {
  const BuatLaporanPage({super.key});

  @override
  State<BuatLaporanPage> createState() => _BuatLaporanPageState();
}

class _BuatLaporanPageState extends State<BuatLaporanPage> {
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  String? selectedLokasi;
  String? selectedKategori;

  @override
  void dispose() {
    _fasilitasController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _kirimLaporan() {
    final fasilitas = _fasilitasController.text.trim();
    final deskripsi = _deskripsiController.text.trim();

    if (fasilitas.isEmpty || selectedLokasi == null || selectedKategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi nama fasilitas, lokasi, dan kategori terlebih dahulu.'),
        ),
      );
      return;
    }

    final laporanBaru = LaporanItem(
      fasilitas: fasilitas,
      lokasi: selectedLokasi!,
      kategori: selectedKategori!,
      deskripsi: deskripsi.isEmpty ? '-' : deskripsi,
      waktu: 'Baru saja',
      status: 'Diajukan',
    );

    daftarLaporanNotifier.value = [
      laporanBaru,
      ...daftarLaporanNotifier.value,
    ];

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Laporan berhasil dikirim ke Riwayat Laporan!'),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RiwayatLaporanPage()),
    );
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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Buat laporan",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kotak Upload Foto Kerusakan
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined, size: 36, color: Color(0xFF1E293B)),
                  SizedBox(height: 8),
                  Text(
                    "Tambah Foto Kerusakan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Tap untuk memilih Foto",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Input Nama Fasilitas
            const Text(
              "Nama Fasilitas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _fasilitasController,
              decoration: InputDecoration(
                hintText: "Contoh: AC, Meja, Kursi, dll",
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown Lokasi Kerusakan
            const Text(
              "Lokasi Kerusakan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLokasi,
                  isExpanded: true,
                  hint: Text(
                    "Pilih Lokasi",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF1E293B)),
                  items: [
                    "Gedung Rektorat",
                    "Gedung FEBI",
                    "Gedung FST",
                    "Gedung FTIK",
                    "Gedung Perpustakaan",
                  ]
                      .map((lokasi) => DropdownMenuItem(value: lokasi, child: Text(lokasi)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLokasi = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown Kategori Kerusakan
            const Text(
              "Kategori Kerusakan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedKategori,
                  isExpanded: true,
                  hint: Text(
                    "Pilih Kategori",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF1E293B)),
                  items: ["Ringan", "Sedang", "Berat / Rusak Total"]
                      .map((kategori) => DropdownMenuItem(value: kategori, child: Text(kategori)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedKategori = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Deskripsi Kerusakan
            const Text(
              "Deskripsi Kerusakan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _deskripsiController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Jelaskan Kerusakan secara detail...",
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Kirim Laporan
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _kirimLaporan,
                child: const Text(
                  "Kirim laporan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}