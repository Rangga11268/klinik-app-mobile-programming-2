import 'package:flutter/material.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();

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
                const TextField(
                  decoration: InputDecoration(labelText: "NIP"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: "Nama Pegawai"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: "Tanggal Lahir"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: "Nomor Telepon"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
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
