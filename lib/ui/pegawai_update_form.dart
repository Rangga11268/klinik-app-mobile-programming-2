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

  bool _obscurePassword = true;

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
            widget.pegawai.nip = _nipCtrl.text.trim();
            widget.pegawai.nama = _namaCtrl.text.trim();
            widget.pegawai.tanggalLahir = _tglLahirCtrl.text.trim();
            widget.pegawai.nomorTelepon = _teleponCtrl.text.trim();
            widget.pegawai.email = _emailCtrl.text.trim();
            widget.pegawai.password = _passwordCtrl.text.trim();
            Navigator.pop(context, widget.pegawai);
          }
        },
        child: const Text("Simpan Perubahan", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
