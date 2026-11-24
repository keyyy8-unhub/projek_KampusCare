import 'package:flutter/material.dart';

class DetailLaporanPage extends StatelessWidget {
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
            // Foto Laporan Placeholder
            Container(
              width: double.infinity,
              height: 220,
              color: const Color(0xFFE2E8F0),
              child: const Icon(
                Icons.image_outlined,
                size: 60,
                color: Color(0xFF94A3B8),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul + Badge Status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 143, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // icon lokasi dan calender
                  _buildInfoRow(
                    Icons.location_on_outlined,
                    "Lokasi",
                    location,
                  ),
                  _buildInfoRow(
                    Icons.calendar_today_outlined,
                    "Tanggal Laporan",
                    date,
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 8),

                  // Deskripsi
                  const Text(
                    "Deskripsi Laporan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "AC tidak dingin dan mengeluarkan suara berisik",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF475569),
                      height: 1.5,
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
          Icon(icon, size: 20, color: Color(0xFF475569)),
          const SizedBox(width: 8),
          Text(
            "$label: ",
            style: const TextStyle(
              color:Color(0xFF475569),
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