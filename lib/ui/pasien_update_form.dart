import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomorRmCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tglLahirCtrl;
  late TextEditingController _teleponCtrl;
  late TextEditingController _alamatCtrl;

  @override
  void initState() {
    super.initState();
    _nomorRmCtrl = TextEditingController(text: widget.pasien.nomorRm);
    _namaCtrl = TextEditingController(text: widget.pasien.nama);
    _tglLahirCtrl = TextEditingController(text: widget.pasien.tanggalLahir ?? "");
    _teleponCtrl = TextEditingController(text: widget.pasien.nomorTelepon ?? "");
    _alamatCtrl = TextEditingController(text: widget.pasien.alamat ?? "");
  }

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
    DateTime initial = DateTime(1995, 1, 1);
    if (_tglLahirCtrl.text.isNotEmpty) {
      DateTime? parsed = DateTime.tryParse(_tglLahirCtrl.text);
      if (parsed != null) initial = parsed;
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initial,
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
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
                      widget.pasien.nomorRm = _nomorRmCtrl.text.trim();
                      widget.pasien.nama = _namaCtrl.text.trim();
                      widget.pasien.tanggalLahir = _tglLahirCtrl.text.trim();
                      widget.pasien.nomorTelepon = _teleponCtrl.text.trim();
                      widget.pasien.alamat = _alamatCtrl.text.trim();
                      Navigator.pop(context, widget.pasien);
                    }
                  },
                  child: const Text("Simpan Perubahan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
