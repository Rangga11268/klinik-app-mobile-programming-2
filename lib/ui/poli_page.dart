import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';
import 'sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
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
