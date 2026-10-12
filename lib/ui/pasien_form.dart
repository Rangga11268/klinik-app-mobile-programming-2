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
                _fieldNomorRm(),
                const SizedBox(height: 12),
                _fieldNama(),
                const SizedBox(height: 12),
                _fieldTanggalLahir(context),
                const SizedBox(height: 12),
                _fieldTelepon(),
                const SizedBox(height: 12),
                _fieldAlamat(),
                const SizedBox(height: 24),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNomorRm() {
    return TextFormField(
      controller: _nomorRmCtrl,
      decoration: const InputDecoration(
        labelText: "Nomor RM",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nomor RM wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: "Nama Pasien",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nama Pasien wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldTanggalLahir(BuildContext context) {
    return TextFormField(
      controller: _tglLahirCtrl,
      readOnly: true,
      onTap: () => _pilihTanggalLahir(context),
      decoration: const InputDecoration(
        labelText: "Tanggal Lahir",
        hintText: "Pilih tanggal lahir",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Tanggal Lahir wajib dipilih";
        }
        return null;
      },
    );
  }

  Widget _fieldTelepon() {
    return TextFormField(
      controller: _teleponCtrl,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: "Nomor Telepon",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nomor Telepon wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldAlamat() {
    return TextFormField(
      controller: _alamatCtrl,
      maxLines: 2,
      decoration: const InputDecoration(
        labelText: "Alamat",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Alamat wajib diisi";
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
        child: const Text("Simpan", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
