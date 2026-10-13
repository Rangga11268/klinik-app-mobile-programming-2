import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';
import 'sidebar.dart';

class Poli37 extends StatefulWidget {
  const Poli37({super.key});

  @override
  State<Poli37> createState() => _Poli37State();
}

class _Poli37State extends State<Poli37> {
  List<Poli> listPoli = [
    Poli(namaPoli: "POLI MATA"),
    Poli(namaPoli: "POLI PENYAKIT DALAM"),
    Poli(namaPoli: "POLI KULIT"),
    Poli(namaPoli: "POLI TULANG"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Data Poli - DARELL RANGGA PUTRA RACHMAN",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "No. Absen: 37",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage("assets/img/profile-picture.png"),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.add,
                        size: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              final messenger = ScaffoldMessenger.of(context);
              final newPoli = await Navigator.push<Poli>(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              if (newPoli != null) {
                setState(() {
                  listPoli.add(newPoli);
                });
                messenger.showSnackBar(
                  SnackBar(
                    content: Text("Data ${newPoli.namaPoli} berhasil ditambahkan!"),
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
        itemCount: listPoli.length,
        itemBuilder: (context, index) {
          final item = listPoli[index];
          return PoliItem(
            poli: item,
            onDelete: () {
              final deletedName = item.namaPoli;
              setState(() {
                listPoli.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Data $deletedName berhasil dihapus!"),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            onUpdate: () {
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Data ${item.namaPoli} berhasil diperbarui!"),
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

// Alias untuk kompatibilitas
typedef PoliPage = Poli37;