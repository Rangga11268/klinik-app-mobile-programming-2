import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  late String _nomorRm;
  late String _nama;
  late String _tglLahir;
  late String _telepon;
  late String _alamat;

  @override
  void initState() {
    super.initState();
    _nomorRm = widget.pasien.nomorRm;
    _nama = widget.pasien.nama;
    _tglLahir = widget.pasien.tanggalLahir ?? "";
    _telepon = widget.pasien.nomorTelepon ?? "";
    _alamat = widget.pasien.alamat ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pasien")),
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
                    Text("Nomor RM : $_nomorRm", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Nama Pasien : $_nama", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Tanggal Lahir : $_tglLahir", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Nomor Telepon : $_telepon", style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("Alamat : $_alamat", style: const TextStyle(fontSize: 16)),
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
        final updated = await Navigator.push<Pasien>(
          context,
          MaterialPageRoute(
            builder: (context) => PasienUpdateForm(pasien: widget.pasien),
          ),
        );
        if (updated != null) {
          setState(() {
            _nomorRm = updated.nomorRm;
            _nama = updated.nama;
            _tglLahir = updated.tanggalLahir ?? "";
            _telepon = updated.nomorTelepon ?? "";
            _alamat = updated.alamat ?? "";
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
            content: const Text("Yakin ingin menghapus data pasien ini?"),
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
