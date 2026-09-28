import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Darell Rangga Putra Rachman"),
                subtitle: Text("NIM/NIP: 19241009 (Absen: 37)"),
              ),
            ),
            onTap: () {
              Pegawai pegawai = Pegawai(
                id: 37,
                nip: "19241009",
                nama: "Darell Rangga Putra Rachman",
                tanggalLahir: "2005-11-26",
                nomorTelepon: "081234567890",
                email: "darell.rangga@klinik.com",
                password: "password123",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Siti Rahma"),
                subtitle: Text("NIP: 199002022015022002"),
              ),
            ),
            onTap: () {
              Pegawai pegawai = Pegawai(
                id: 2,
                nip: "199002022015022002",
                nama: "Siti Rahma",
                tanggalLahir: "1990-02-02",
                nomorTelepon: "081298765432",
                email: "siti.rahma@klinik.com",
                password: "password123",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Ahmad Fauzi"),
                subtitle: Text("NIP: 199203032018031003"),
              ),
            ),
            onTap: () {
              Pegawai pegawai = Pegawai(
                id: 3,
                nip: "199203032018031003",
                nama: "Ahmad Fauzi",
                tanggalLahir: "1992-03-03",
                nomorTelepon: "081311223344",
                email: "ahmad.fauzi@klinik.com",
                password: "password123",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
