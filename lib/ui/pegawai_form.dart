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
  bool _obscurePassword = true;

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
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1995, 1, 1),
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
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _fieldNip(),
                const SizedBox(height: 12),
                _fieldNama(),
                const SizedBox(height: 12),
                _fieldTanggalLahir(context),
                const SizedBox(height: 12),
                _fieldTelepon(),
                const SizedBox(height: 12),
                _fieldEmail(),
                const SizedBox(height: 12),
                _fieldPassword(),
                const SizedBox(height: 24),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNip() {
    return TextFormField(
      controller: _nipCtrl,
      decoration: const InputDecoration(
        labelText: "NIP",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "NIP wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: "Nama Pegawai",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nama Pegawai wajib diisi";
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

  Widget _fieldEmail() {
    return TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Email wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldPassword() {
    return TextFormField(
      controller: _passwordCtrl,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Password wajib diisi";
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
        child: const Text("Simpan", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
