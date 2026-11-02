import 'package:flutter/material.dart';
import 'package:proyek_kampuscare/pages/register_page.dart';

class HalamanLogin extends StatelessWidget {
  const HalamanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
    body: Column(
      children: [
        Icon(Icons.home),
        Text("Hallo selamat datang di Halaman Login"),
        SizedBox(height: 12),

        const TextField(
          decoration: InputDecoration(
            hintText: "Masukan Username",
          ),
        ),
        const SizedBox(height: 12),

        const TextField(
          decoration: InputDecoration(
            hintText: "Masukan Password",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 12),

        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanRegister()));
          }, 
          child: const Text("Register dulu"),
        ),
        //belium punya akun? register dulu
      ],
    ),
    );
  }
}