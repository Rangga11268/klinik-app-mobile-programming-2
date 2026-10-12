import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_update_form.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Nama Poli : ${widget.poli.namaPoli}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tombolUbah(),
                const SizedBox(width: 20),
                _tombolHapus(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tombolUbah() {
    return ElevatedButton(
      onPressed: () async {
        final updated = await Navigator.push<Poli>(
          context,
          MaterialPageRoute(
            builder: (context) => PoliUpdateForm(poli: widget.poli),
          ),
        );
        if (updated != null) {
          setState(() {});
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text("Ubah", style: TextStyle(fontSize: 16)),
    );
  }

  Widget _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // tutup dialog
                  Navigator.pop(context, 'delete'); // kembali ke list dengan signal delete
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("YA"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // batal
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tidak"),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text("Hapus", style: TextStyle(fontSize: 16)),
    );
  }
}
