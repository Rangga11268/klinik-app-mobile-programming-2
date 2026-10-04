import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiForm()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
            pegawai: Pegawai(
              nip: "198801012015011001",
              nama: "Dr. Budi Santoso, Sp.A",
              tanggalLahir: "1988-01-01",
              nomorTelepon: "081234567890",
              email: "budi@klinik.com",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              nip: "199002022016022002",
              nama: "Siti Rahmawati, S.Kep",
              tanggalLahir: "1990-02-02",
              nomorTelepon: "081298765432",
              email: "siti@klinik.com",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              nip: "199203032017031003",
              nama: "Ahmad Fauzi, S.Farm",
              tanggalLahir: "1992-03-03",
              nomorTelepon: "081311223344",
              email: "ahmad@klinik.com",
            ),
          ),
        ],
      ),
    );
  }
}

