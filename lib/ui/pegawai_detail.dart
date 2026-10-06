import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  late String _nip;
  late String _nama;
  late String _tglLahir;
  late String _telepon;
  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    _nip = widget.pegawai.nip;
    _nama = widget.pegawai.nama;
    _tglLahir = widget.pegawai.tanggalLahir ?? "";
    _telepon = widget.pegawai.nomorTelepon ?? "";
    _email = widget.pegawai.email ?? "";
    _password = widget.pegawai.password ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NIP : $_nip", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Nama Pegawai : $_nama", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Tanggal Lahir : $_tglLahir", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Nomor Telepon : $_telepon", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Email : $_email", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Password : ${'*' * _password.length}", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tombolUbah(),
                _tombolHapus(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tombolUbah() {
    return ElevatedButton(
      onPressed: () async {
        final updated = await Navigator.push<Pegawai>(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai),
          ),
        );
        if (updated != null) {
          setState(() {
            _nip = updated.nip;
            _nama = updated.nama;
            _tglLahir = updated.tanggalLahir ?? "";
            _telepon = updated.nomorTelepon ?? "";
            _email = updated.email ?? "";
            _password = updated.password ?? "";
          });
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  Widget _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text("Yakin ingin menghapus data pegawai ini?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, 'delete');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("YA"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tidak"),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
