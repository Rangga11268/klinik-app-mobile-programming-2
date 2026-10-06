import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void dispose() {
    _nomorRmCtrl.dispose();
    _namaCtrl.dispose();
    _tglLahirCtrl.dispose();
    _teleponCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggalLahir(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1995, 1, 1),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      setState(() {
        _tglLahirCtrl.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nomorRmCtrl,
                  decoration: const InputDecoration(labelText: "Nomor RM"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _namaCtrl,
                  decoration: const InputDecoration(labelText: "Nama Pasien"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _tglLahirCtrl,
                  readOnly: true,
                  onTap: () => _pilihTanggalLahir(context),
                  decoration: const InputDecoration(
                    labelText: "Tanggal Lahir",
                    hintText: "Pilih tanggal lahir",
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _teleponCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Nomor Telepon"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _alamatCtrl,
                  decoration: const InputDecoration(labelText: "Alamat"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_namaCtrl.text.trim().isNotEmpty && _nomorRmCtrl.text.trim().isNotEmpty) {
                      Pasien pasienBaru = Pasien(
                        nomorRm: _nomorRmCtrl.text.trim(),
                        nama: _namaCtrl.text.trim(),
                        tanggalLahir: _tglLahirCtrl.text.trim(),
                        nomorTelepon: _teleponCtrl.text.trim(),
                        alamat: _alamatCtrl.text.trim(),
                      );
                      Navigator.pop(context, pasienBaru);
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
