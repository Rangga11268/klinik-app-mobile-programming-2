import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';
import 'sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  List<Pegawai> listPegawai = [
    Pegawai(
      id: "1",
      nip: "198801012015011001",
      nama: "Dr. Budi Santoso, Sp.A",
      tanggalLahir: "1988-01-01",
      nomorTelepon: "081234567890",
      email: "budi@klinik.com",
      password: "password123",
    ),
    Pegawai(
      id: "2",
      nip: "199002022016022002",
      nama: "Siti Rahmawati, S.Kep",
      tanggalLahir: "1990-02-02",
      nomorTelepon: "081298765432",
      email: "siti@klinik.com",
      password: "password123",
    ),
    Pegawai(
      id: "3",
      nip: "199203032017031003",
      nama: "Ahmad Fauzi, S.Farm",
      tanggalLahir: "1992-03-03",
      nomorTelepon: "081311223344",
      email: "ahmad@klinik.com",
      password: "password123",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add, size: 28),
            ),
            onTap: () async {
              final newPegawai = await Navigator.push<Pegawai>(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiForm()),
              );
              if (newPegawai != null) {
                setState(() {
                  listPegawai.add(newPegawai);
                });
              }
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listPegawai.length,
        itemBuilder: (context, index) {
          final item = listPegawai[index];
          return PegawaiItem(
            pegawai: item,
            onDelete: () {
              setState(() {
                listPegawai.removeAt(index);
              });
            },
            onUpdate: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
