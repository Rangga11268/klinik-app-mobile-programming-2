import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pasien")),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Andi Pratama"),
                subtitle: Text("Nomor RM: RM-001"),
              ),
            ),
            onTap: () {
              Pasien pasien = Pasien(
                id: 1,
                nomorRm: "RM-001",
                nama: "Andi Pratama",
                tanggalLahir: "1995-05-12",
                nomorTelepon: "085211223344",
                alamat: "Jl. Merdeka No. 10, Jakarta",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Dewi Lestari"),
                subtitle: Text("Nomor RM: RM-002"),
              ),
            ),
            onTap: () {
              Pasien pasien = Pasien(
                id: 2,
                nomorRm: "RM-002",
                nama: "Dewi Lestari",
                tanggalLahir: "1998-08-20",
                nomorTelepon: "085299887766",
                alamat: "Jl. Sudirman No. 45, Bandung",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Rizky Saputra"),
                subtitle: Text("Nomor RM: RM-003"),
              ),
            ),
            onTap: () {
              Pasien pasien = Pasien(
                id: 3,
                nomorRm: "RM-003",
                nama: "Rizky Saputra",
                tanggalLahir: "2000-11-15",
                nomorTelepon: "087755443322",
                alamat: "Jl. Diponegoro No. 88, Surabaya",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
