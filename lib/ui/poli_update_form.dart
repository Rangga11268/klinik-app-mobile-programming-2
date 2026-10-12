import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaPoliCtrl;

  @override
  void initState() {
    super.initState();
    _namaPoliCtrl = TextEditingController(text: widget.poli.namaPoli);
  }

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _fieldNamaPoli(),
                const SizedBox(height: 20),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama Poli",
        border: OutlineInputBorder(),
      ),
      controller: _namaPoliCtrl,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nama Poli wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            widget.poli.namaPoli = _namaPoliCtrl.text.trim();
            Navigator.pop(context, widget.poli);
          }
        },
        child: const Text("Simpan Perubahan", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
