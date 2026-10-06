import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tglLahirCtrl.dispose();
    _teleponCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nipCtrl,
                  decoration: const InputDecoration(labelText: "NIP"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _namaCtrl,
                  decoration: const InputDecoration(labelText: "Nama Pegawai"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _tglLahirCtrl,
                  decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _teleponCtrl,
                  decoration: const InputDecoration(labelText: "Nomor Telepon"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_namaCtrl.text.trim().isNotEmpty && _nipCtrl.text.trim().isNotEmpty) {
                      Pegawai pegawaiBaru = Pegawai(
                        nip: _nipCtrl.text.trim(),
                        nama: _namaCtrl.text.trim(),
                        tanggalLahir: _tglLahirCtrl.text.trim(),
                        nomorTelepon: _teleponCtrl.text.trim(),
                        email: _emailCtrl.text.trim(),
                        password: _passwordCtrl.text.trim(),
                      );
                      Navigator.pop(context, pegawaiBaru);
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
