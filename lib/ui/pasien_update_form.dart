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
    DateTime initial = DateTime(2000, 1, 1);
    if (_tglLahirCtrl.text.isNotEmpty) {
      DateTime? parsed = DateTime.tryParse(_tglLahirCtrl.text);
      if (parsed != null && parsed.isBefore(DateTime.now())) {
        initial = parsed;
      }
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      helpText: "PILIH TANGGAL LAHIR",
      cancelText: "BATAL",
      confirmText: "PILIH",
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
      decoration: InputDecoration(
        labelText: "Tanggal Lahir",
        hintText: "Pilih tanggal lahir",
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month, color: Colors.blue),
          onPressed: () => _pilihTanggalLahir(context),
          tooltip: "Pilih Tanggal Lahir",
        ),
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
            widget.pasien.nomorRm = _nomorRmCtrl.text.trim();
            widget.pasien.nama = _namaCtrl.text.trim();
            widget.pasien.tanggalLahir = _tglLahirCtrl.text.trim();
            widget.pasien.nomorTelepon = _teleponCtrl.text.trim();
            widget.pasien.alamat = _alamatCtrl.text.trim();
            Navigator.pop(context, widget.pasien);
          }
        },
        child: const Text("Simpan Perubahan", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
