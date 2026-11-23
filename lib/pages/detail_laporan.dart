import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
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