# Ringkasan Materi & Kode Pertemuan 3 (Sesuai Modul)

**Mata Kuliah:** Mobile Programming II / Mobile Programming 2  
**Topik:** Memisahkan List Poli menjadi Poli Item dan Membuat Form Tambah Poli  
**Project:** Klinik App (`klinik37`)  

---

## 🎯 Capaian Pembelajaran Pertemuan 3
1. Memisahkan widget item list data menjadi komponen modular tersendiri (`PoliItem`).
2. Menerapkan `StatelessWidget` pada `PoliItem` untuk render baris item dan penanganan gesture navigasi ke `PoliDetail`.
3. Menambahkan icon `+` (`Icons.add`) pada `actions` di `AppBar` halaman utama.
4. Membuat halaman form input baru (`PoliForm`) dengan `TextField`, `FormState`, dan tombol `Simpan`.
5. Menghubungkan navigasi dari icon tambah di `AppBar` menuju `PoliForm`.

---

## 📂 Struktur File Pertemuan 3

```
klinik37/
├── assets/
├── lib/
│   ├── model/
│   │   └── poli.dart
│   ├── ui/
│   │   ├── poli_37.dart (PoliPage)
│   │   ├── poli_detail.dart
│   │   ├── poli_item.dart
│   │   └── poli_form.dart
│   └── main.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── module/
    ├── PERTEMUAN_2.md
    └── PERTEMUAN_3.md
```

---

## 💻 Rincian Kode Sumber

### 1. Komponen Poli Item (`lib/ui/poli_item.dart`)
*(Modul Halaman 13)*

```dart
import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;

  const PoliItem({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PoliDetail(poli: poli),
          ),
        );
      },
    );
  }
}
```

---

### 2. Halaman Form Tambah Poli (`lib/ui/poli_form.dart`)
*(Modul Halaman 14)*

```dart
import 'package:flutter/material.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "Nama Poli"),
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
```

---

### 3. Halaman Daftar Poli (`lib/ui/poli_37.dart`)
*(Modul Halaman 15)*

```dart
import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';

class Poli37 extends StatefulWidget {
  const Poli37({super.key});

  @override
  State<Poli37> createState() => _Poli37State();
}

class _Poli37State extends State<Poli37> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Data Poli - DARELL RANGGA PUTRA RACHMAN",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "No. Absen: 37",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PoliItem(poli: Poli(namaPoli: "POLI MATA")),
          PoliItem(poli: Poli(namaPoli: "POLI PENYAKIT DALAM")),
          PoliItem(poli: Poli(namaPoli: "POLI KULIT")),
          PoliItem(poli: Poli(namaPoli: "POLI TULANG")),
        ],
      ),
    );
  }
}

typedef PoliPage = Poli37;
```
