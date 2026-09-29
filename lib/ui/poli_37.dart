import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class Poli37 extends StatefulWidget {
  const Poli37({super.key});

  @override
  State<Poli37> createState() => _Poli37State();
}

class _Poli37State extends State<Poli37> {
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
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("POLI MATA"),
              ),
            ),
            onTap: () {
              Poli poliMata = Poli(namaPoli: "POLI MATA");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliMata),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("POLI PENYAKIT DALAM"),
              ),
            ),
            onTap: () {
              Poli poliPenyakitDalam = Poli(namaPoli: "POLI PENYAKIT DALAM");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliPenyakitDalam),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("POLI KULIT"),
              ),
            ),
            onTap: () {
              Poli poliKulit = Poli(namaPoli: "POLI KULIT");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliKulit),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("POLI TULANG"),
              ),
            ),
            onTap: () {
              Poli poliTulang = Poli(namaPoli: "POLI TULANG");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliTulang),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Alias untuk kompatibilitas
typedef PoliPage = Poli37;