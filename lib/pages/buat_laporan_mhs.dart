import 'package:flutter/material.dart';
import 'riwayat_laporan.dart';

// PENYIMPANAN DATA
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

class DetailLaporanPage extends StatefulWidget {
  final String title;
  final String location;
  final String date;
  final String status;

  const DetailLaporanPage({
    super.key,
    this.title = "AC Ruang 302",
    this.location = "Gedung FEBI",
    this.date = "12 Juni 2026",
    this.status = "Diajukan",
  });

  @override
  State<DetailLaporanPage> createState() => _DetailLaporanPageState();
}

<<<<<<< HEAD
class _BuatLaporanPageState extends State<BuatLaporanPage> {
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  String? selectedLokasi;
  String? selectedKategori;
=======
class _DetailLaporanPageState extends State<DetailLaporanPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _imageFade;
  late Animation<Offset> _headerSlide;
  late Animation<double> _headerFade;
  late Animation<Offset> _infoSlide;
  late Animation<double> _infoFade;
  late Animation<Offset> _descSlide;
  late Animation<double> _descFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // 1. Transisi Foto (0% - 45%)
    _imageFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
    );

    // 2. Transisi Judul & Badge Status (20% - 65%)
    _headerFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.65, curve: Curves.easeOut),
    );
    _headerSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.65, curve: Curves.easeOutCubic),
    ));

    // 3. Transisi Info Detail (35% - 80%)
    _infoFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.80, curve: Curves.easeOut),
    );
    _infoSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.80, curve: Curves.easeOutCubic),
    ));

    // 4. Transisi Deskripsi Laporan (50% - 100%)
    _descFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.50, 1.0, curve: Curves.easeOut),
    );
    _descSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.50, 1.0, curve: Curves.easeOutCubic),
    ));

    // Jalankan animasi saat halaman dibuka
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
>>>>>>> 27c61ae (update detail)

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
<<<<<<< HEAD
          onPressed: () {
            Navigator.pop(context);
          },
=======
          onPressed: () => Navigator.pop(context),
>>>>>>> 27c61ae (update detail)
        ),
        title: const Text(
          "Detail Laporan",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF1E293B)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Laporan Placeholder dengan FadeTransition & Hero
            FadeTransition(
              opacity: _imageFade,
              child: Hero(
                tag: 'laporan_image_${widget.title}',
                child: Container(
                  width: double.infinity,
                  height: 220,
                  color: const Color(0xFFE2E8F0),
                  child: const Icon(
                    Icons.image_outlined,
                    size: 60,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
<<<<<<< HEAD
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
=======
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul + Badge Status dengan Slide & Fade
                  SlideTransition(
                    position: _headerSlide,
                    child: FadeTransition(
                      opacity: _headerFade,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDBEAFE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.status,
                              style: const TextStyle(
                                color: Color(0xFF1D4ED8),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
>>>>>>> 27c61ae (update detail)
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Info Detail dengan Slide & Fade
                  SlideTransition(
                    position: _infoSlide,
                    child: FadeTransition(
                      opacity: _infoFade,
                      child: Column(
                        children: [
                          _buildInfoRow(
                            Icons.location_on_outlined,
                            "Lokasi",
                            widget.location,
                          ),
                          _buildInfoRow(
                            Icons.calendar_today_outlined,
                            "Tanggal Laporan",
                            widget.date,
                          ),
                          _buildInfoRow(
                            Icons.person_outline,
                            "Pelapor",
                            "Ahmad Rizki - Mahasiswa FEBI",
                          ),
                          _buildInfoRow(
                            Icons.confirmation_number_outlined,
                            "ID Laporan",
                            "#LAP-2026-0142",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 8),

                  // Deskripsi dengan Slide & Fade
                  SlideTransition(
                    position: _descSlide,
                    child: FadeTransition(
                      opacity: _descFade,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deskripsi Laporan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "AC tidak dingin dan mengeluarkan suara berlebih",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF475569),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
<<<<<<< HEAD
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
=======
>>>>>>> 27c61ae (update detail)
          ],
        ),
      ),
    );
  }

  // Helper Widget
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF64748B)),
          const SizedBox(width: 8),
          Text(
            "$label: ",
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}