import 'package:flutter/material.dart';
import 'login_akd.dart'; 

class LoginMhsScreen extends StatefulWidget {
  const LoginMhsScreen({super.key});

  @override
  State<LoginMhsScreen> createState() => _LoginMhsScreenState();
}

class _LoginMhsScreenState extends State<LoginMhsScreen> {
  final bool _isMahasiswaSelected = true; // Karena ini halaman Mahasiswa, tetap true
  bool _obscurePassword = true;

  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8D9E6), // Warna latar belakang Sky Blue
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Judul Halaman di atas Card
                const Text(
                  'LOGIN MAHASISWA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4156),
                    letterSpacing: 1.2,
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
                      // Logo & Brand KampusCare
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
                        'Laporkan, Pantau, Perbaiki',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF567C8D),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Toggle Peran (Mahasiswa / Akademik)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F4F8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            // Tombol Mahasiswa (Aktif di sini)
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2F4156),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Text(
                                  'Mahasiswa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            // Tombol Akademik (DIUBAH KE NAVIGATOR AGAR PINDAH HALAMAN)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginAkademikScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Akademik',
                                    style: TextStyle(
                                      color: Color(0xFF567C8D),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Input NIM
                      TextField(
                        controller: _nimController,
                        decoration: InputDecoration(
                          hintText: 'NIM',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF567C8D)),
                          filled: true,
                          fillColor: const Color(0xFFF9FBFC),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                            // Aksi tombol login
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
                            // Aksi daftar akun
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
                      GestureDetector(
                        onTap: () {
                          // Aksi lupa password
                        },
                        child: const Text(
                          'Lupa password?',
                          style: TextStyle(
                            color: Color(0xFF567C8D),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
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