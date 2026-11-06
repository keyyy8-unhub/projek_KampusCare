import 'package:flutter/material.dart';
import 'login_mhs.dart'; // Untuk navigasi kembali ke halaman login mahasiswa

class LoginAkademikScreen extends StatefulWidget {
  const LoginAkademikScreen({super.key});

  @override
  State<LoginAkademikScreen> createState() => _LoginAkademikScreenState();
}

class _LoginAkademikScreenState extends State<LoginAkademikScreen> {
  final TextEditingController _nidnController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8D9E6), // Sky Blue background sesuai Figma
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Judul Halaman di atas Card
                const Text(
                  'LOGIN AKADEMIK',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4156),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                // Card Putih Utama
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Logo / Icon Akademik
                      const Icon(
                        Icons.home_work_rounded,
                        size: 50,
                        color: Color(0xFF2F4156),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'KampusCare',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F4156),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Portal Staf & Akademik',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF567C8D),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Toggle Tab (Mahasiswa / Akademik)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F4F8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            // Tombol ke Mahasiswa (Tidak Aktif - Bisa Diklik)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginMhsScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Mahasiswa',
                                    style: TextStyle(
                                      color: Color(0xFF567C8D),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Tombol Akademik (Aktif - Berwarna Navy)
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2F4156),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Text(
                                  'Akademik',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Input NIDN / Username Staf
                      TextField(
                        controller: _nidnController,
                        decoration: InputDecoration(
                          hintText: 'NIDN / Username Staf',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.badge_outlined, color: Color(0xFF567C8D)),
                          filled: true,
                          fillColor: const Color(0xFFF9FBFC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Input Password
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF567C8D)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9FBFC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Tombol Login
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi login akademik
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F4156),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        'atau',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 16),

                      // Tombol Daftar Akun
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            // Aksi daftar akun staf
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Daftar Akun',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF2F4156),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tautan Lupa Password
                      const Text(
                        'Lupa password?',
                        style: TextStyle(
                          color: Color(0xFF567C8D),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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