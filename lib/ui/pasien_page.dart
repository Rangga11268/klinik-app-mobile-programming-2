import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_form.dart';
import 'pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
            pasien: Pasien(
              nomorRm: "RM-001",
              nama: "Rizky Ramadhan",
              tanggalLahir: "2000-05-10",
              nomorTelepon: "085678901234",
              alamat: "Jl. Margonda No. 12",
            ),
          ),
          PasienItem(
            pasien: Pasien(
              nomorRm: "RM-002",
              nama: "Dewi Lestari",
              tanggalLahir: "1995-08-20",
              nomorTelepon: "087812345678",
              alamat: "Jl. Fatmawati No. 45",
            ),
          ),
          PasienItem(
            pasien: Pasien(
              nomorRm: "RM-003",
              nama: "Bambang Pamungkas",
              tanggalLahir: "1980-06-10",
              nomorTelepon: "081912345678",
              alamat: "Jl. Sudirman No. 88",
            ),
          ),
        ],
      ),
    );
  }
}
