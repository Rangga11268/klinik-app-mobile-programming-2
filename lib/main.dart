import 'package:flutter/material.dart';
import './ui/poli_page.dart';
// import './ui/pegawai_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const PoliPage(),
      // home: const PegawaiPage(),
      // home: const PasienPage(),
    );
  }
}
