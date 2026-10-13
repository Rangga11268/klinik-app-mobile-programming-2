import 'package:flutter/material.dart';
import './ui/beranda.dart';
// import './ui/poli_37.dart'; // Alternatif jika ingin langsung ke Poli
// import './ui/login.dart';   // Alternatif jika ingin mulai dari Login

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
      home: const Beranda(),
    );
  }
}
