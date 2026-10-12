import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_form.dart';
import 'pasien_item.dart';
import 'sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> listPasien = [
    Pasien(
      id: "1",
      nomorRm: "RM-001",
      nama: "Rizky Ramadhan",
      tanggalLahir: "2000-05-10",
      nomorTelepon: "085678901234",
      alamat: "Jl. Margonda No. 12",
    ),
    Pasien(
      id: "2",
      nomorRm: "RM-002",
      nama: "Dewi Lestari",
      tanggalLahir: "1995-08-20",
      nomorTelepon: "087812345678",
      alamat: "Jl. Fatmawati No. 45",
    ),
    Pasien(
      id: "3",
      nomorRm: "RM-003",
      nama: "Bambang Pamungkas",
      tanggalLahir: "1980-06-10",
      nomorTelepon: "081912345678",
      alamat: "Jl. Sudirman No. 88",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add, size: 28),
            ),
            onTap: () async {
              final messenger = ScaffoldMessenger.of(context);
              final newPasien = await Navigator.push<Pasien>(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );
              if (newPasien != null) {
                setState(() {
                  listPasien.add(newPasien);
                });
                messenger.showSnackBar(
                  SnackBar(
                    content: Text("Pasien ${newPasien.nama} berhasil ditambahkan!"),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listPasien.length,
        itemBuilder: (context, index) {
          final item = listPasien[index];
          return PasienItem(
            pasien: item,
            onDelete: () {
              final deletedName = item.nama;
              setState(() {
                listPasien.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Pasien $deletedName berhasil dihapus!"),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            onUpdate: () {
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Data ${item.nama} berhasil diperbarui!"),
                  backgroundColor: Colors.blue,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
