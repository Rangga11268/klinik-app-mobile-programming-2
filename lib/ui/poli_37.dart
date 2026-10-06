import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';

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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add, size: 28),
            ),
            onTap: () async {
              final newPoli = await Navigator.push<Poli>(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              if (newPoli != null) {
                setState(() {
                  listPoli.add(newPoli);
                });
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
              setState(() {
                listPoli.removeAt(index);
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

// Alias untuk kompatibilitas
typedef PoliPage = Poli37;