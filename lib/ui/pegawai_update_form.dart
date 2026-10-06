import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nipCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tglLahirCtrl;
  late TextEditingController _teleponCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;

  @override
  void initState() {
    super.initState();
    _nipCtrl = TextEditingController(text: widget.pegawai.nip);
    _namaCtrl = TextEditingController(text: widget.pegawai.nama);
    _tglLahirCtrl = TextEditingController(text: widget.pegawai.tanggalLahir ?? "");
    _teleponCtrl = TextEditingController(text: widget.pegawai.nomorTelepon ?? "");
    _emailCtrl = TextEditingController(text: widget.pegawai.email ?? "");
    _passwordCtrl = TextEditingController(text: widget.pegawai.password ?? "");
  }

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

  Future<void> _pilihTanggalLahir(BuildContext context) async {
    DateTime initial = DateTime(1995, 1, 1);
    if (_tglLahirCtrl.text.isNotEmpty) {
      DateTime? parsed = DateTime.tryParse(_tglLahirCtrl.text);
      if (parsed != null) initial = parsed;
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1950),
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
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
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
                      widget.pegawai.nip = _nipCtrl.text.trim();
                      widget.pegawai.nama = _namaCtrl.text.trim();
                      widget.pegawai.tanggalLahir = _tglLahirCtrl.text.trim();
                      widget.pegawai.nomorTelepon = _teleponCtrl.text.trim();
                      widget.pegawai.email = _emailCtrl.text.trim();
                      widget.pegawai.password = _passwordCtrl.text.trim();
                      Navigator.pop(context, widget.pegawai);
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
