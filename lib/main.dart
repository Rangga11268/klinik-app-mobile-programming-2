import 'package:flutter/material.dart';
import './ui/poli_37.dart';
// import './ui/login.dart'; // Aktifkan jika ingin mulai dari halaman Login (Pertemuan 6)

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP - DARELL RANGGA PUTRA RACHMAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // Default ke Data Poli agar sesuai fokus penilaian Pertemuan 4
      home: const Poli37(),
    );
  }
}
