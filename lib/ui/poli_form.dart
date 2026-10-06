import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _namaPoliCtrl,
                  decoration: const InputDecoration(labelText: "Nama Poli"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_namaPoliCtrl.text.trim().isNotEmpty) {
                      Poli poliBaru = Poli(namaPoli: _namaPoliCtrl.text.trim());
                      Navigator.pop(context, poliBaru);
                    }
                  },
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
